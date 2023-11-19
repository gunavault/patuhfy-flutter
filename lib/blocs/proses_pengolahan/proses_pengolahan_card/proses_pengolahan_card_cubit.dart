import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/proses_pengolahan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'proses_pengolahan_card_state.dart';

class ProsesPengolahanCardCubit extends Cubit<ProsesPengolahanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ProsesPengolahanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsProsesPengolahanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    // List<ProsesPengolahanFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await localDataSource.getCurrentUser();

      ProsesPengolahanFormModelSelectResponse response =
          await RemoteDataSource().getProsesPengolahanByTanggal(
              taskDate.toString(), userModel.nik_sap, userModel.token);

      if (response.dataForm.length > 0) {
        emit(IsProsesPengolahanAswered(true, response.dataForm.first));
      } else {
        emit(IsProsesPengolahanAswered(false, null));
      }
    } else {
      // Jika Offline
      emit(NoConnectionProsesPengolahanCardState());
    }
  }
}
