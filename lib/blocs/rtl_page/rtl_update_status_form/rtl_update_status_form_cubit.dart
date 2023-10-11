import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/rtl_update_status_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'rtl_update_status_form_state.dart';

class RtlUpdateStatusFormCubit extends Cubit<RtlUpdateStatusFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RtlUpdateStatusFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialRtlUpdateStatusFormState());

  storedOnline(RtlUpdateStatusFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal

    // setelah itu simpen ke database holding
    RtlUpdateStatusFormModelResponse resFromApi =
        await remoteDataSource.updateStatusRtl(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      emit(SuccessRtlUpdateStatusFormState(
          status_code: resFromApi.status_code,
          message: resFromApi.message,
          dataRtl: resFromApi.rtlData));
    } else {
      emit(ErrorRtlUpdateStatusFormState('Oops, Something Wrong!'));
    }
  }

  resetStatus() {
    emit(InitialRtlUpdateStatusFormState());
  }

  submitToDatabase(RtlUpdateStatusFormModel dataForm) async {
    try {
      emit(LoadingRtlUpdateStatusFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.updatedBy = userModel.nik_sap;

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database

      print('cek data sblm dikirim ${dataForm.toJson()}');
      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        emit(ErrorRtlUpdateStatusFormState('Oops, No Connection'));
      }
    } catch (err) {
      emit(ErrorRtlUpdateStatusFormState('error'));
    }
  }
}
