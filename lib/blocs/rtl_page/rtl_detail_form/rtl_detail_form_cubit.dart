import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/rtl_detail_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'rtl_detail_form_state.dart';

class RtlDetailFormCubit extends Cubit<RtlDetailFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RtlDetailFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialRtlDetailFormState());

  storedOnline(RtlDetailFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal

    // setelah itu simpen ke database holding
    RtlDetailFormModelResponse resFromApi =
        await remoteDataSource.createRtlDetail(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      emit(SuccessRtlDetailFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(ErrorRtlDetailFormState('Oops, Something Wrong!'));
    }
  }

  submitToDatabase(RtlDetailFormModel dataForm) async {
    try {
      emit(LoadingRtlDetailFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database

      print('cek data sblm dikirim ${dataForm.toJson()}');
      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        emit(ErrorRtlDetailFormState('Oops, No Connection'));
      }
    } catch (err) {
      emit(ErrorRtlDetailFormState('error'));
    }
  }
}
