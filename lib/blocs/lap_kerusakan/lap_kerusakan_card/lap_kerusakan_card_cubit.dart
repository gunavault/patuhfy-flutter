import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';

part 'lap_kerusakan_card_state.dart';

class LapKerusakanCardCubit extends Cubit<LapKerusakanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  LapKerusakanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsLapKerusakanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<LapKerusakanFormModel>   cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataLapKerusakanByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsLapKerusakanAswered(false, null));
      } else {
        // Send to Database Server Holding
        emit(IsLapKerusakanAswered(true, cekData.first));
      }
    } else {
      cekData = await localDataSource
          .getDataLapKerusakanByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsLapKerusakanAswered(false, null));
      } else {
        emit(IsLapKerusakanAswered(true, cekData.first));
      }
    }
  }
}
