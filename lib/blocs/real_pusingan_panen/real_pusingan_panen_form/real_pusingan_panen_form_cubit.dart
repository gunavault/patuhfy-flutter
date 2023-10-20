import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';
import 'package:patuhfy/models/real_pusingan_panen_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'real_pusingan_panen_form_state.dart';

class RealPusinganPanenFormCubit extends Cubit<RealPusinganPanenFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPusinganPanenFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialRealPusinganPanenFormState());

  List<RealPusinganPanenFormModel> unsyncedData = [];

  storedOffline(RealPusinganPanenFormModel dataForm) async {
    // set lat and long jika gak ada signal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataForm.lat = prefs.getString(lat);
    dataForm.long = prefs.getString(long);
    dataForm.isSend = 0;

    List<RealPusinganPanenFormModel> cekLength;
    cekLength = await localDataSource
        .getDataRealPusinganPanenByTanggal(dataForm.tanggal.toString());
    UserModel userModel = await localDataSource.getCurrentUser();

    if (cekLength.isEmpty) {
      //Check duplikat
      await localDataSource.addDataRealPusinganPanen(dataForm);
      if (await hasInternetConnection()) {
        for (var unsyncedForm in unsyncedData) {
          storedOnline(unsyncedForm, userModel);
        }
        unsyncedData.clear();
      }
    }

    emit(SuccessRealPusinganPanenFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cekLength.length}');
  }

  storedOnline(RealPusinganPanenFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    dataForm.isSend = 1;

    // setelah itu simpen ke database holding
    RealPusinganPanenFormModelResponse resFromApi =
        await remoteDataSource.createRealPusinganPanen(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      List<RealPusinganPanenFormModel> cekLength;
      cekLength = await localDataSource
          .getDataRealPusinganPanenByTanggal(dataForm.tanggal.toString());

      if (cekLength.isEmpty) {
        //Check duplikat
        await localDataSource.addDataRealPusinganPanen(dataForm);
      }

      emit(SuccessRealPusinganPanenFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedRealPusinganPanenFormState(
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

  submitToDatabase(RealPusinganPanenFormModel dataForm) async {
    try {
      emit(LoadingRealPusinganPanenFormState());
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
        localDataSource.deleteDataRealPusinganPanenByDate(
            dataForm.tanggal.toString()); //Hapus data di Lokal By Date
        emit(ErrorRealPusinganPanenFormState(err.toString())); //Emit Error State
      } else {
        emit(SuccessRealPusinganPanenFormState(
            status_code: 200, message: 'Inserted to Lokal Database'));
      }
    }
  }

  // createRealPusinganPanen(
  //     RealPusinganPanenFormModel dataFormRealPusinganPanen, String kode_sales_order) async {

  // }
}
