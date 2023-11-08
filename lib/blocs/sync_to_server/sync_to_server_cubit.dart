import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/apel_pagi_pengolahan_form_model.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/real_pemeliharaan_jalan_form_model.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';
import 'package:patuhfy/models/real_penunasan_form_model.dart';
import 'package:patuhfy/models/real_penyiangan_form_model.dart';
import 'package:patuhfy/models/real_pusingan_panen_form_model.dart';
import 'package:patuhfy/models/real_rencana_pengangkutan_form_model.dart';
import 'package:patuhfy/models/real_restan_form_model.dart';
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
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deleteApelPagiById(dataForm.id);
          }
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  // Function for ApelPagiPengolahanFormModel
  Future<bool> syncApelPagiPengolahan(String token) async {
    try {
      int count = await localDataSource.getApelPagiPengolahanDataNotSend() ?? 0;
      if (count > 0) {
        List<ApelPagiPengolahanFormModel> listData =
            await localDataSource.getAllDataApelPagiPengolahanDataNotSend();
        print('listData $listData');
        for (ApelPagiPengolahanFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          ApelPagiPengolahanFormModelResponse dataResponse =
              await remoteDataSource.createApelPagiPengolahan(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource
                .deleteApelPagiPengolahanById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for InspeksiHancaFormModel
  Future<bool> syncInspeksiHanca(String token) async {
    try {
      int count = await localDataSource.getInspeksiHancaDataNotSend() ?? 0;
      if (count > 0) {
        List<InspeksiHancaFormModel> listData =
            await localDataSource.getAllDataInspeksiHancaDataNotSend();
        print('listData $listData');
        for (InspeksiHancaFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          InspeksiHancaFormModelResponse dataResponse =
              await remoteDataSource.createInspeksiHanca(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deleteInspeksiHancaById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for InspeksiTphFormModel
  Future<bool> syncInspeksiTph(String token) async {
    try {
      int count = await localDataSource.getInspeksiTphDataNotSend() ?? 0;
      if (count > 0) {
        List<InspeksiTphFormModel> listData =
            await localDataSource.getAllDataInspeksiTphDataNotSend();
        for (InspeksiTphFormModel dataForm in listData) {
          InspeksiTphFormModelResponse dataResponse =
              await remoteDataSource.createInspeksiTph(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deleteInspeksiTphById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for LapKerusakanFormModel
  Future<bool> syncLapKerusakan(String token) async {
    try {
      int count = await localDataSource.getLapKerusakanDataNotSend() ?? 0;
      if (count > 0) {
        List<LapKerusakanFormModel> listData =
            await localDataSource.getAllDataLapKerusakanDataNotSend();
        print('listData $listData');
        for (LapKerusakanFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          LapKerusakanFormModelResponse dataResponse =
              await remoteDataSource.createLapKerusakan(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deleteLapKerusakanById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for PencurianTbsFormModel
  Future<bool> syncPencurianTbs(String token) async {
    try {
      int count = await localDataSource.getPencurianTbsDataNotSend() ?? 0;
      if (count > 0) {
        List<PencurianTbsFormModel> listData =
            await localDataSource.getAllDataPencurianTbsDataNotSend();
        print('listData $listData');
        for (PencurianTbsFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          PencurianTbsFormModelResponse dataResponse =
              await remoteDataSource.createPencurianTbs(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deletePencurianTbsById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for RealPemeliharaanJalanFormModel
  Future<bool> syncRealPemeliharaanJalan(String token) async {
    try {
      int count =
          await localDataSource.getRealPemeliharaanJalanDataNotSend() ?? 0;
      if (count > 0) {
        List<RealPemeliharaanJalanFormModel> listData =
            await localDataSource.getAllDataRealPemeliharaanJalanDataNotSend();
        print('listData $listData');
        for (RealPemeliharaanJalanFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          RealPemeliharaanJalanFormModelResponse dataResponse =
              await remoteDataSource.createRealPemeliharaanJalan(
                  token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource
                .deleteRealPemeliharaanJalanById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for RealPemupukanFormModel
  Future<bool> syncRealPemupukan(String token) async {
    try {
      int count = await localDataSource.getRealPemupukanDataNotSend() ?? 0;
      if (count > 0) {
        List<RealPemupukanFormModel> listData =
            await localDataSource.getAllDataRealPemupukanDataNotSend();
        print('listData $listData');
        for (RealPemupukanFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          RealPemupukanFormModelResponse dataResponse =
              await remoteDataSource.createRealPemupukan(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deleteRealPemupukanById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for RealPengendalianHamaFormModel
  Future<bool> syncRealPengendalianHama(String token) async {
    try {
      int count =
          await localDataSource.getRealPengendalianHamaDataNotSend() ?? 0;
      if (count > 0) {
        List<RealPengendalianHamaFormModel> listData =
            await localDataSource.getAllDataRealPengendalianHamaDataNotSend();
        print('listData $listData');
        for (RealPengendalianHamaFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          RealPengendalianHamaFormModelResponse dataResponse =
              await remoteDataSource.createRealPengendalianHama(
                  token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource
                .deleteRealPengendalianHamaById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for RealPenunasanFormModel
  Future<bool> syncRealPenunasan(String token) async {
    try {
      int count = await localDataSource.getRealPenunasanDataNotSend() ?? 0;
      if (count > 0) {
        List<RealPenunasanFormModel> listData =
            await localDataSource.getAllDataRealPenunasanDataNotSend();
        print('listData $listData');
        for (RealPenunasanFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          RealPenunasanFormModelResponse dataResponse =
              await remoteDataSource.createRealPenunasan(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deleteRealPenunasanById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for RealPenyianganFormModel
  Future<bool> syncRealPenyiangan(String token) async {
    print('kesini penyiangan');
    try {
      int count = await localDataSource.getRealPenyianganDataNotSend() ?? 0;
      if (count > 0) {
        List<RealPenyianganFormModel> listData =
            await localDataSource.getAllDataRealPenyianganDataNotSend();
        print('listData $listData');
        for (RealPenyianganFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          RealPenyianganFormModelResponse dataResponse =
              await remoteDataSource.createRealPenyiangan(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource
                .deleteRealPenyianganById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for RealPusinganPanenFormModel
  Future<bool> syncRealPusinganPanen(String token) async {
    try {
      int count = await localDataSource.getRealPusinganPanenDataNotSend() ?? 0;
      if (count > 0) {
        List<RealPusinganPanenFormModel> listData =
            await localDataSource.getAllDataRealPusinganPanenDataNotSend();
        print('listData $listData');
        for (RealPusinganPanenFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          RealPusinganPanenFormModelResponse dataResponse =
              await remoteDataSource.createRealPusinganPanen(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource
                .deleteRealPusinganPanenById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
    }
  }

// Function for RealRestanFormModel
  Future<bool> syncRealRestan(String token) async {
    try {
      int count = await localDataSource.getRealRestanDataNotSend() ?? 0;
      if (count > 0) {
        List<RealRestanFormModel> listData =
            await localDataSource.getAllDataRealRestanDataNotSend();
        print('listData $listData');
        for (RealRestanFormModel dataForm in listData) {
          print('Processing form: ${dataForm.toJson()}');
          RealRestanFormModelResponse dataResponse =
              await remoteDataSource.createRealRestan(token, dataForm);
          if (dataResponse.status_code == 200 ||
              dataResponse.status_code == 409) {
            await localDataSource.deleteRealRestanById(dataForm.id!.toInt());
          }
        }
      }
      return true; // Synchronization successful
    } catch (e) {
      return false; // Error occurred during synchronization
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
      await syncApelPagiPengolahan(userModel.token.toString());
      await syncInspeksiHanca(userModel.token.toString());
      await syncInspeksiTph(userModel.token.toString());
      await syncLapKerusakan(userModel.token.toString());
      await syncPencurianTbs(userModel.token.toString());
      await syncRealPemeliharaanJalan(userModel.token.toString());
      await syncRealPemupukan(userModel.token.toString());
      await syncRealPengendalianHama(userModel.token.toString());
      await syncRealPenunasan(userModel.token.toString());
      await syncRealPenyiangan(userModel.token.toString());
      await syncRealPusinganPanen(userModel.token.toString());
      await syncRealRestan(userModel.token.toString());

      Timer(Duration(seconds: 2), () async {
        emit(SuccessSyncToServerState(message: 'Sussess', status_code: 200));
      });
    } else {
      emit(NoConnectionSyncToServerState('Oops, Periksa Koneksi Anda!'));
    }
  }
}
