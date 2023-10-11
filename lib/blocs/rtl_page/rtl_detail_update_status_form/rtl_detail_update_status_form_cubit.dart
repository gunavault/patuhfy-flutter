import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/rtl_detail_update_status_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'rtl_detail_update_status_form_state.dart';

class RtlDetailUpdateStatusFormCubit
    extends Cubit<RtlDetailUpdateStatusFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RtlDetailUpdateStatusFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialRtlDetailUpdateStatusFormState());

  storedOnline(
      RtlDetailUpdateStatusFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal

    // setelah itu simpen ke database holding
    RtlDetailUpdateStatusFormModelResponse resFromApi =
        await remoteDataSource.updateStatusRtlDetail(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      emit(SuccessRtlDetailUpdateStatusFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(ErrorRtlDetailUpdateStatusFormState('Oops, Something Wrong!'));
    }
  }

  submitToDatabase(RtlDetailUpdateStatusFormModel dataForm) async {
    try {
      emit(LoadingRtlDetailUpdateStatusFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.updatedBy = userModel.nik_sap;

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database

      print('cek data sblm dikirim ${dataForm.toJson()}');
      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        emit(ErrorRtlDetailUpdateStatusFormState('Oops, No Connection'));
      }
    } catch (err) {
      emit(ErrorRtlDetailUpdateStatusFormState('error'));
    }
  }
}
