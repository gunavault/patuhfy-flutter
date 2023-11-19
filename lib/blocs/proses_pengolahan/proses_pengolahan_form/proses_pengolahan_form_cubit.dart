import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/proses_pengolahan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'proses_pengolahan_form_state.dart';

class ProsesPengolahanFormCubit extends Cubit<ProsesPengolahanFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ProsesPengolahanFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialProsesPengolahanFormState());

  storedOnline(ProsesPengolahanFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    // setelah itu simpen ke database holding
    ProsesPengolahanFormModelResponse resFromApi =
        await remoteDataSource.createProsesPengolahan(
      userModel.token,
      dataForm,
    );

    print('testing ${resFromApi.status_code}');

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      emit(SuccessProsesPengolahanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    } else {
      emit(DuplicatedProsesPengolahanFormState(
          status_code: resFromApi.status_code, message: resFromApi.message));
    }
  }

  submitToDatabase(ProsesPengolahanFormModel dataForm) async {
    try {
      emit(LoadingProsesPengolahanFormState());
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
        emit(NoConnectionProsesPengolahanFormState());
      }
    } catch (err) {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        emit(ErrorProsesPengolahanFormState(err.toString())); //Emit Error State
      } else {
        emit(NoConnectionProsesPengolahanFormState());
      }
    }
  }

  // createProsesPengolahan(
  //     ProsesPengolahanFormModel dataFormProsesPengolahan, String kode_sales_order) async {

  // }
}
