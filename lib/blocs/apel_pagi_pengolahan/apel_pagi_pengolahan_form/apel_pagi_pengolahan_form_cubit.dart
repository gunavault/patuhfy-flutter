import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'apel_pagi_pengolahan_form_state.dart';

class ApelPagiPengolahanFormCubit extends Cubit<ApelPagiPengolahanFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPagiPengolahanFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialApelPagiPengolahanFormState());

  storedOffline(ApelPagiPengolahanFormModel dataForm) async {
    // set lat and long jika gak ada signal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataForm.latMulai = double.parse(prefs.getString(lat).toString());
    dataForm.longMulai = double.parse(prefs.getString(long).toString());
    dataForm.isSend = 0;

    List<ApelPagiPengolahanFormModel> cekLength;
    cekLength = await localDataSource
        .getDataApelPagiPengolahanByTanggal(dataForm.tanggal.toString());

    if (cekLength.isEmpty) {
      //Check duplikat
      await localDataSource.addDataApelPagiPengolahan(dataForm);
    }

    emit(SuccessApelPagiPengolahanFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cekLength.length}');
  }

  storedOnline(
      ApelPagiPengolahanFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    dataForm.latMulai = double.parse(position.latitude.toString());
    dataForm.longMulai = double.parse(position.longitude.toString());
    dataForm.isSend = 1;

    // setelah itu simpen ke database holding
    ApelPagiPengolahanFormModelResponse resFromApi =
        await remoteDataSource.createApelPagiPengolahan(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      List<ApelPagiPengolahanFormModel> cekLength;
      cekLength = await localDataSource
          .getDataApelPagiPengolahanByTanggal(dataForm.tanggal.toString());

      if (cekLength.isEmpty) {
        //Check duplikat
        await localDataSource.addDataApelPagiPengolahan(dataForm);
      }

      emit(SuccessApelPagiPengolahanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedApelPagiPengolahanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    }
  }

  submitToDatabase(ApelPagiPengolahanFormModel dataForm) async {
    try {
      emit(LoadingApelPagiPengolahanFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime dateToday = DateTime.now();
      String today = dateToday.toString().substring(0, 19);

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.tanggal = today;
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
        localDataSource.deleteDataApelPagiPengolahanByDate(
            dataForm.tanggal.toString()); //Hapus data di Lokal By Date
        emit(ErrorApelPagiPengolahanFormState(
            err.toString())); //Emit Error State
      } else {
        emit(SuccessApelPagiPengolahanFormState(
            status_code: 200, message: 'Inserted to Lokal Database'));
      }
    }
  }

  // createApelPagiPengolahan(
  //     ApelPagiPengolahanFormModel dataFormApelPagiPengolahan, String kode_sales_order) async {

  // }
}
