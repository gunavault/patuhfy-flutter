import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/apel_pengolahan_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'apel_pengolahan_card_state.dart';

class ApelPengolahanCardCubit extends Cubit<ApelPengolahanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPengolahanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsApelPengolahanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    // List<ApelPengolahanFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await localDataSource.getCurrentUser();

      ApelPengolahanFormModelSelectResponse response = await RemoteDataSource()
          .getDataApelPengolahanByTanggal(
              taskDate.toString(), userModel.nik_sap, userModel.token);
      print('data dari remote ${response.dataForm.length}');
      if (response.dataForm.length > 0) {
        print('kesini');
        emit(IsApelPengolahanAswered(true, response.dataForm.first));
      } else {
        emit(IsApelPengolahanAswered(false, null));
      } 
    } else {
      // Jika Offline
      emit(IsApelPengolahanAswered(false, null));
    }
  }
}
