import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'apel_pagi_form_state.dart';

class ApelPagiFormCubit extends Cubit<ApelPagiFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPagiFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialApelPagiFormState());

  storedOffline(ApelPagiFormModel dataForm) async {
    // set lat and long jika gak ada signal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataForm.lat = prefs.getString(lat);
    dataForm.long = prefs.getString(long);
    dataForm.isSend = 0;

    List<ApelPagiFormModel> cekLength;
    cekLength = await localDataSource
        .getDataApelPagiByTanggal(dataForm.tanggal.toString());

    if (cekLength.isEmpty) {
      //Check duplikat
      await localDataSource.addDataApelPagi(dataForm);
    }

    emit(SuccessApelPagiFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cekLength.length}');
  }

  storedOnline(ApelPagiFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    dataForm.isSend = 1;

    // setelah itu simpen ke database holding
    ApelPagiFormModelResponse resFromApi =
        await remoteDataSource.createApelPagi(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      List<ApelPagiFormModel> cekLength;
      cekLength = await localDataSource
          .getDataApelPagiByTanggal(dataForm.tanggal.toString());

      if (cekLength.isEmpty) {
        //Check duplikat
        await localDataSource.addDataApelPagi(dataForm);
      }

      emit(SuccessApelPagiFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedApelPagiFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    }
  }

  submitToDatabase(ApelPagiFormModel dataForm) async {
    try {
      emit(LoadingApelPagiFormState());
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
        localDataSource.deleteDataAPelPagiByDate(
            dataForm.tanggal.toString()); //Hapus data di Lokal By Date
        emit(ErrorApelPagiFormState(err.toString())); //Emit Error State
      } else {
        emit(SuccessApelPagiFormState(
            status_code: 200, message: 'Inserted to Lokal Database'));
      }
    }
  }

  // createApelPagi(
  //     ApelPagiFormModel dataFormApelPagi, String kode_sales_order) async {

  // }
}
