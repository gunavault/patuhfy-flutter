import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/real_pemeliharaan_jalan_form_model.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';

part 'real_pemeliharaan_jalan_card_state.dart';

class RealPemeliharaanJalanCardCubit extends Cubit<RealPemeliharaanJalanCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RealPemeliharaanJalanCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsRealPemeliharaanJalanAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<RealPemeliharaanJalanFormModel> cekData;

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      cekData = await localDataSource
          .getDataRealPemeliharaanJalanByTanggalOnlineOrOffline(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPemeliharaanJalanAswered(false, null));
      } else {
        emit(IsRealPemeliharaanJalanAswered(
            true, cekData.first)); // Send to Database Server Holding
      }
    } else {
      cekData = await localDataSource
          .getDataRealPemeliharaanJalanByTanggal(taskDate.toString());

      if (cekData.isEmpty) {
        emit(IsRealPemeliharaanJalanAswered(false, null));
      } else {
        emit(IsRealPemeliharaanJalanAswered(true, cekData.first));
      }
    }
  }
}
