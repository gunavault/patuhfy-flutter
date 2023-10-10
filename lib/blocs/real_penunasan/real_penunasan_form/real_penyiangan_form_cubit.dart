import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/models/real_penunasan_form_model.dart';
import 'package:patuhfy/models/real_penyiangan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'real_penyiangan_form_state.dart';

class RealPenunasanFormCubit extends Cubit<RealPenunasanFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPenunasanFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialRealPenunasanFormState());

  storedOffline(RealPenunasanFormModel dataForm) async {
    // set lat and long jika gak ada signal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataForm.lat = prefs.getString(lat);
    dataForm.long = prefs.getString(long);
    dataForm.isSend = 0;

    List<RealPenunasanFormModel> cekLength;
    cekLength = await localDataSource
        .getDataRealPenunasanByTanggal(dataForm.tanggal.toString());

    if (cekLength.isEmpty) {
      //Check duplikat
      await localDataSource.addDataRealPenunasan(dataForm);
    }

    emit(SuccessRealPenunasanFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cekLength.length}');
  }

  storedOnline(RealPenunasanFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    dataForm.isSend = 1;

    // setelah itu simpen ke database holding
    RealPenunasanFormModelResponse resFromApi =
        await remoteDataSource.createRealPenunasan(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      List<RealPenunasanFormModel> cekLength;
      cekLength = await localDataSource
          .getDataRealPenunasanByTanggal(dataForm.tanggal.toString());

      if (cekLength.isEmpty) {
        //Check duplikat
        await localDataSource.addDataRealPenunasan(dataForm);
      }

      emit(SuccessRealPenunasanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedRealPenunasanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    }
  }

  submitToDatabase(RealPenunasanFormModel dataForm) async {
    try {
      emit(LoadingRealPenunasanFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime dateToday = DateTime.now();
      String today = dateToday.toString().substring(0, 10);
      String todayCreatedAt = dateToday.toString().substring(0, 19);

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.tanggal = today;
      dataForm.mobileCreatedAt = todayCreatedAt;
      // dataForm.company = userModel.company_code;
      dataForm.unitKerja = userModel.psa;

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database

      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        storedOffline(
            dataForm); // By Default saved local database (offlinemode)
      }
    } catch (err) {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        localDataSource.deleteDataRealPenunasanByDate(
            dataForm.tanggal.toString()); //Hapus data di Lokal By Date
        emit(ErrorRealPenunasanFormState(err.toString())); //Emit Error State
      } else {
        emit(SuccessRealPenunasanFormState(
            status_code: 200, message: 'Inserted to Lokal Database'));
      }
    }
  }

  // createRealPenunasan(
  //     RealPenunasanFormModel dataFormRealPenunasan, String kode_sales_order) async {

  // }
}
