import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
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
    dataForm.lat = prefs.getString('lat');
    dataForm.long = prefs.getString('long');

    List<ApelPagiFormModel> cek_length;
    cek_length = await localDataSource
        .getDataApelPagiByTanggal(dataForm.tanggal.toString());

    if (cek_length.length == 0) {
      //Check duplikat
      await localDataSource.addDataApelPagi(dataForm);
    }

    emit(SuccessApelPagiFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cek_length.length}');
  }

  storedOnline(ApelPagiFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();

    print('latitude ${position.latitude}`');
    print('longitude ${position.longitude}`');
    // Simpen dulu yang offline
    List<ApelPagiFormModel> cek_length;
    cek_length = await localDataSource
        .getDataApelPagiByTanggal(dataForm.tanggal.toString());

    if (cek_length.length == 0) {
      //Check duplikat
      await localDataSource.addDataApelPagi(dataForm);
    }
    // setelah itu simpen ke database holding
    ApelPagiFormModelResponse res_from_api =
        await remoteDataSource.createApelPagi(
      userModel.token,
      dataForm,
    );

    if (res_from_api.status_code == 200) {
      emit(SuccessApelPagiFormState(
          status_code: res_from_api.status_code,
          message: res_from_api.message));
    } else {
      emit(DuplicatedApelPagiFormState(
          status_code: res_from_api.status_code,
          message: res_from_api.message));
    }
  }

  submitToDatabase(ApelPagiFormModel dataForm) async {
    try {
      emit(LoadingApelPagiFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime dateToday = new DateTime.now();
      String today = dateToday.toString().substring(0, 10);

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.tanggal = today;
      dataForm.company = userModel.company_code;
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
