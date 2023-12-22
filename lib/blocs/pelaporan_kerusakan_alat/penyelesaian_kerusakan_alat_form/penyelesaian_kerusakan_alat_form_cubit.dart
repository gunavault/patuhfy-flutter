import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/penyelesaian_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/rtl_detail_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'penyelesaian_kerusakan_alat_form_state.dart';

class PenyelesaiankerusakanAlatFormCubit extends Cubit<PenyelesaiankerusakanAlatFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PenyelesaiankerusakanAlatFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialPenyelesaiankerusakanAlatFormState());

  storedOnline(PenyelesaianKerusakanAlatModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal

    // setelah itu simpen ke database holding
    PenyelesaianKerusakanAlatModelResponse resFromApi =
        await remoteDataSource.createPenyelesaianKerusakanAlat(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      emit(SuccessPenyelesaiankerusakanAlatFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(ErrorPenyelesaiankerusakanAlatFormState('Oops, Something Wrong!'));
    }
  }

  submitToDatabase(PenyelesaianKerusakanAlatModel dataForm) async {
    try {
      emit(LoadingPenyelesaiankerusakanAlatFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database

      print('cek data sblm dikirim ${dataForm.toJson()}');
      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        emit(ErrorPenyelesaiankerusakanAlatFormState('Oops, No Connection'));
      }
    } catch (err) {
      emit(ErrorPenyelesaiankerusakanAlatFormState('error'));
    }
  }
}
