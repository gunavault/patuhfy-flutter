import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'lap_kerusakan_form_state.dart';

class LapKerusakanFormCubit extends Cubit<LapKerusakanFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  LapKerusakanFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialLapKerusakanFormState());

  storedOffline(LapKerusakanFormModel dataForm) async {
    // set lat and long jika gak ada signal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataForm.lat = prefs.getString('lat');
    dataForm.long = prefs.getString('long');
    dataForm.isSend = 0;

    List<LapKerusakanFormModel> cek_length;
    cek_length = await localDataSource
        .getDataLapKerusakanByTanggal(dataForm.tanggal.toString());

    if (cek_length.length == 0) {
      //Check duplikat
      await localDataSource.addDataLapKerusakan(dataForm);
    }

    emit(SuccessLapKerusakanFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cek_length.length}');
  }

  storedOnline(LapKerusakanFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    dataForm.isSend = 1;

    // setelah itu simpen ke database holding
    LapKerusakanFormModelResponse res_from_api =
        await remoteDataSource.createLapKerusakan(
      userModel.token,
      dataForm,
    );

    if (res_from_api.status_code == 200) {
      // Simpen dulu yang offline
      List<LapKerusakanFormModel> cek_length;
      cek_length = await localDataSource
          .getDataLapKerusakanByTanggal(dataForm.tanggal.toString());

      if (cek_length.length == 0) {
        //Check duplikat
        await localDataSource.addDataLapKerusakan(dataForm);
      }

      emit(SuccessLapKerusakanFormState(
          status_code: res_from_api.status_code,
          message: res_from_api.message));
    } else {
      emit(DuplicatedLapKerusakanFormState(
          status_code: res_from_api.status_code,
          message: res_from_api.message));
    }
  }

  submitToDatabase(LapKerusakanFormModel dataForm) async {
    try {
      emit(LoadingLapKerusakanFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime dateToday = new DateTime.now();
      String today = dateToday.toString().substring(0, 10);

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
        localDataSource.deleteDataLapKerusakanByDate(
            dataForm.tanggal.toString()); //Hapus data di Lokal By Date
        emit(ErrorLapKerusakanFormState(err.toString())); //Emit Error State
      } else {
        emit(SuccessLapKerusakanFormState(
            status_code: 200, message: 'Inserted to Lokal Database'));
      }
    }
  }

  // createLapKerusakan(
  //     LapKerusakanFormModel dataFormLapKerusakan, String kode_sales_order) async {

  // }
}
