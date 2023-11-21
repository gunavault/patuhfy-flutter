import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/cek_monitoring_ipal.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'cek_sampel_losis_form_state.dart';

class CekMonitoringIpalFormCubit extends Cubit<CekMonitoringIpalFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  CekMonitoringIpalFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialCekMonitoringIpalFormState());

  storedOnline(CekMonitoringIpalFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    // setelah itu simpen ke database holding
    CekMonitoringIpalFormModelResponse resFromApi =
        await remoteDataSource.createCekMonitoringIpal(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      emit(SuccessCekMonitoringIpalFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedCekMonitoringIpalFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    }
  }

  submitToDatabase(CekMonitoringIpalFormModel dataForm) async {
    try {
      emit(LoadingCekMonitoringIpalFormState());
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
        emit(NoConnectionCekMonitoringIpalFormState());
      }
    } catch (err) {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        emit(ErrorCekMonitoringIpalFormState(err.toString())); //Emit Error State
      } else {
        emit(NoConnectionCekMonitoringIpalFormState());
      }
    }
  }

  // createCekMonitoringIpal(
  //     CekMonitoringIpalFormModel dataFormCekMonitoringIpal, String kode_sales_order) async {

  // }
}
