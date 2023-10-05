import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'inspeksi_tph_form_state.dart';

class InspeksiTphFormCubit extends Cubit<InspeksiTphFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  InspeksiTphFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialInspeksiTphFormState());

  storedOffline(InspeksiTphFormModel dataForm) async {
    // set lat and long jika gak ada signal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dataForm.lat = prefs.getString('lat');
    dataForm.long = prefs.getString('long');
    dataForm.isSend = 0;

    List<InspeksiTphFormModel> cekLength;
    cekLength = await localDataSource
        .getDataInspeksiTphByTanggal(dataForm.tanggal.toString());

    if (cekLength.isEmpty) {
      //Check duplikat
      await localDataSource.addDataInspeksiTph(dataForm);
    }

    emit(SuccessInspeksiTphFormState(
        status_code: 200, message: 'Inserted to Lokal Database'));

    print('bepraisi data ${cekLength.length}');
  }

  storedOnline(InspeksiTphFormModel dataForm, UserModel userModel) async {
    // set lat and long jika ada sinyal
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    dataForm.lat = position.latitude.toString();
    dataForm.long = position.longitude.toString();
    dataForm.isSend = 1;

    // simpen ke database holding
    InspeksiTphFormModelResponse resFromApi =
        await remoteDataSource.createInspeksiTph(
      userModel.token,
      dataForm,
    );

    if (resFromApi.status_code == 200) {
      // Simpen dulu yang offline
      List<InspeksiTphFormModel> cekLength;
      cekLength = await localDataSource
          .getDataInspeksiTphByTanggal(dataForm.tanggal.toString());

      if (cekLength.isEmpty) {
        //Check duplikat
        await localDataSource.addDataInspeksiTph(dataForm);
      }

      emit(SuccessInspeksiTphFormState(
          status_code: resFromApi.status_code,
          message: resFromApi.message));
    } else {
      emit(DuplicatedInspeksiTphFormState(
          status_code: resFromApi.status_code,
          message: resFromApi.message));
    }
  }

  submitToDatabase(InspeksiTphFormModel dataForm) async {
    try {
      emit(LoadingInspeksiTphFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime dateToday = DateTime.now();
      String today = dateToday.toString().substring(0, 10);

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.tanggal = today;
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
        localDataSource.deleteDataInspeksiTphByDate(
            dataForm.tanggal.toString()); //Hapus data di Lokal By Date
        emit(ErrorInspeksiTphFormState(err.toString())); //Emit Error State
      } else {
        emit(SuccessInspeksiTphFormState(
            status_code: 200, message: 'Inserted to Lokal Database'));
      }
    }
  }

  // createInspeksiTph(
  //     InspeksiTphFormModel dataFormInspeksiTph, String kode_sales_order) async {

  // }
}
