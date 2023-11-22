import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/cek_monitoring_ipal.dart';
import 'package:patuhfy/models/cek_rutin_sortasi.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'cek_rutin_sortasi_form_state.dart';

class CekRutinSortasiFormCubit extends Cubit<CekRutinSortasiFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  CekRutinSortasiFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialCekRutinSortasiFormState());

  storedOnline(CekRutinSortasiFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    // setelah itu simpen ke database holding
    CekRutinSortasiFormModelResponse resFromApi =
        await remoteDataSource.createCekRutinSortasi(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      emit(SuccessCekRutinSortasiFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedCekRutinSortasiFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    }
  }

  submitToDatabase(CekRutinSortasiFormModel dataForm) async {
    try {
      emit(LoadingCekRutinSortasiFormState());
      DateTime dateToday = DateTime.now();
      String today = dateToday.toString().substring(0, 19);
      print('today ini aap $today');
      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.mobile_created_at = today;
      dataForm.pks = userModel.psa;

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database
      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        emit(NoConnectionCekRutinSortasiFormState());
      }
    } catch (err) {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        emit(ErrorCekRutinSortasiFormState(err.toString())); //Emit Error State
      } else {
        emit(NoConnectionCekRutinSortasiFormState());
      }
    }
  }

  // createCekRutinSortasi(
  //     CekRutinSortasiFormModel dataFormCekRutinSortasi, String kode_sales_order) async {

  // }
}
