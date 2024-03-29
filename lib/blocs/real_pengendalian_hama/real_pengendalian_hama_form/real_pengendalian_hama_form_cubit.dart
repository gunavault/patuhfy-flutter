import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'real_pengendalian_hama_form_state.dart';

class RealPengendalianHamaFormCubit extends Cubit<RealPengendalianHamaFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPengendalianHamaFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialRealPengendalianHamaFormState());

  List<RealPengendalianHamaFormModel> unsyncedData = [];

  storedOffline(RealPengendalianHamaFormModel dataForm) async {
    // set lat and long jika gak ada signal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataForm.lat = prefs.getString(lat);
    dataForm.long = prefs.getString(long);
    dataForm.isSend = 0;

    List<RealPengendalianHamaFormModel> cekLength;
    cekLength = await localDataSource
        .getDataRealPengendalianHamaByTanggal(dataForm.tanggal.toString());
    UserModel userModel = await localDataSource.getCurrentUser();

    if (cekLength.isEmpty) {
      //Check duplikat
      await localDataSource.addDataRealPengendalianHama(dataForm);
      if (await hasInternetConnection()) {
        for (var unsyncedForm in unsyncedData) {
          storedOnline(unsyncedForm, userModel);
        }
        unsyncedData.clear();
      }
    }

    emit(SuccessRealPengendalianHamaFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cekLength.length}');
  }

  storedOnline(RealPengendalianHamaFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    dataForm.isSend = 1;

    // setelah itu simpen ke database holding
    RealPengendalianHamaFormModelResponse resFromApi =
        await remoteDataSource.createRealPengendalianHama(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      List<RealPengendalianHamaFormModel> cekLength;
      cekLength = await localDataSource
          .getDataRealPengendalianHamaByTanggal(dataForm.tanggal.toString());

      if (cekLength.isEmpty) {
        //Check duplikat
        await localDataSource.addDataRealPengendalianHama(dataForm);
      }

      emit(SuccessRealPengendalianHamaFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedRealPengendalianHamaFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
                unsyncedData.add(dataForm);
                      print("ini var unsync nya $unsyncedData");


    }
  }

  // Helper function to check if there is an internet connection
  Future<bool> hasInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  submitToDatabase(RealPengendalianHamaFormModel dataForm) async {
    try {
      emit(LoadingRealPengendalianHamaFormState());
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
        localDataSource.deleteDataRealPengendalianHamaByDate(
            dataForm.tanggal.toString()); //Hapus data di Lokal By Date
        emit(ErrorRealPengendalianHamaFormState(err.toString())); //Emit Error State
      } else {
        emit(SuccessRealPengendalianHamaFormState(
            status_code: 200, message: 'Inserted to Lokal Database'));
      }
    }
  }

  // createRealPengendalianHama(
  //     RealPengendalianHamaFormModel dataFormRealPengendalianHama, String kode_sales_order) async {

  // }
}
