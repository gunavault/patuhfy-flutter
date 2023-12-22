import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/analisa_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/rtl_detail_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'analisa_kerusakan_alat_form_state.dart';

class AnalisakerusakanAlatFormCubit extends Cubit<AnalisakerusakanAlatFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  AnalisakerusakanAlatFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialAnalisakerusakanAlatFormState());

  storedOnline(AnalisaKerusakanAlatModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    // setelah itu simpen ke database holding
    AnalisaKerusakanAlatModelResponse resFromApi =
        await remoteDataSource.createAnalisaKerusakanAlat(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      emit(SuccessAnalisakerusakanAlatFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(ErrorAnalisakerusakanAlatFormState('Oops, Something Wrong!'));
    }
  }

  submitToDatabase(AnalisaKerusakanAlatModel dataForm) async {
    try {
      emit(LoadingAnalisakerusakanAlatFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime dateToday = DateTime.now();
      String today = dateToday.toString().substring(0, 19);
      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.mobile_created_at = today;

      final connectivityResult = await (Connectivity()
          .checkConnectivity()); // cCheck if there is connection post to local and database

      print('cek data sblm dikirim ${dataForm.toJson()}');
      if (connectivityResult != ConnectivityResult.none) {
        storedOnline(dataForm, userModel); // Send to Database Server Holding
      } else {
        emit(ErrorAnalisakerusakanAlatFormState('Oops, No Connection'));
      }
    } catch (err) {
      emit(ErrorAnalisakerusakanAlatFormState('error'));
    }
  }
}
