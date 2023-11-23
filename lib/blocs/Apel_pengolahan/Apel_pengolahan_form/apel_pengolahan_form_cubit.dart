import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/apel_pengolahan_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'apel_pengolahan_form_state.dart';

class ApelPengolahanFormCubit extends Cubit<ApelPengolahanFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPengolahanFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialApelPengolahanFormState());

  storedOnline(ApelPengolahanFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    // setelah itu simpen ke database holding
    ApelPengolahanFormModelResponse resFromApi =
        await remoteDataSource.createApelPengolahan(
      userModel.token,
      dataForm,
    );
    print('test ${resFromApi.status_code}');
    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      emit(SuccessApelPengolahanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedApelPengolahanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    }
  }

  submitToDatabase(ApelPengolahanFormModel dataForm) async {
    try {
      emit(LoadingApelPengolahanFormState());
      DateTime dateToday = DateTime.now();
      String today = dateToday.toString().substring(0, 19);
      print('today ini aap $today');
      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.mobile_created_at = today;
      dataForm.pks = userModel.psa;
      print('today ini aap $dataForm');

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database
      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        emit(NoConnectionApelPengolahanFormState());
      }
    } catch (err) {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        emit(ErrorApelPengolahanFormState(err.toString())); //Emit Error State
      } else {
        emit(NoConnectionApelPengolahanFormState());
      }
    }
  }

  // createApelPengolahan(
  //     ApelPengolahanFormModel dataFormApelPengolahan, String kode_sales_order) async {

  // }
}
