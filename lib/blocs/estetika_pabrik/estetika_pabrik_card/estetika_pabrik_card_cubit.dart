import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'estetika_pabrik_card_state.dart';

class EstetikaPabrikCardCubit extends Cubit<EstetikaPabrikCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  EstetikaPabrikCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsEstetikaPabrikAswered(false, null));

  checkIsAnwered(String taskDate) async {
    // List<EstetikaPabrikFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await localDataSource.getCurrentUser();

      EstetikaPabrikFormModelSelectResponse response = await RemoteDataSource()
          .getEstetikaPabrikByTanggal(
              taskDate.toString(), userModel.nik_sap, userModel.token);
      print('data dari remote ${response.dataForm.length}');
      if (response.dataForm.length > 0) {
        print('kesini');
        emit(IsEstetikaPabrikAswered(true, response.dataForm.first));
      } else {
        emit(IsEstetikaPabrikAswered(false, null));
      }
    } else {
      // Jika Offline
      emit(IsEstetikaPabrikAswered(false, null));
    }
  }
}
