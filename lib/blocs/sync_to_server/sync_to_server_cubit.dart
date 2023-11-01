import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sync_to_server_state.dart';

class SyncToServerCubit extends Cubit<SyncToServerState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  SyncToServerCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialSyncToServerState());

  getCountDataNotSend() async {
    print('kesini nih');
    int total = await localDataSource.getCountNotSend();
    print('kesini nih ${total}');
    if (total == 0) {
      emit(NoDataToSyncState(totalData: total));
    } else {
      emit(HasDataToSyncState(totalData: total));
    }
  }

  Future<bool> syncApelPagi(token) async {
    try {
      int apelPagi = (await localDataSource.getApelPagiDataNotSend() ?? 0);
      if (apelPagi > 0) {
        List<ApelPagiFormModel> listData =
            await localDataSource.getAllDataApelPagiDataNotSend();
        print('listData ${listData}');
        listData.forEach((dataForm) async {
          print('awww ${dataForm.toJson()}');
          ApelPagiFormModelResponse dataResponse =
              await remoteDataSource.createApelPagi(token, dataForm);
          if (dataResponse.status_code == 200) {
            await localDataSource.deleteApelPagiById(dataForm.id);
          }
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  syncData() async {
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database
    UserModel userModel = await localDataSource.getCurrentUser();
    if (connectivityResult != ConnectivityResult.none) {
      // syncApelPagi(userModel.token);
      emit(LoadingSyncToServerState());
      await syncApelPagi(userModel.token);

      Timer(Duration(seconds: 3), () async {
        emit(SuccessSyncToServerState(message: 'Sussess', status_code: 200));

        print("Yeah, this line is printed after 3 seconds");
      });
    } else {
      emit(NoConnectionSyncToServerState('Oops, Periksa Koneksi Anda!'));
    }
  }
}
