import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/mandor_model.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'sync_masterdata_state.dart';

class SyncMasterdataCubit extends Cubit<SyncMasterdataState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  SyncMasterdataCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialSyncMasterdataState());

  refreshDataAfdeling() async {
    try {
      emit(LoadingSyncMasterdataState());
      final UserModel user =
          await localDataSource.getCurrentUser() ?? UserModel();

      var afdelingModelResponse =
          await RemoteDataSource().getAfdelingData(user.psa, user.token);

      List<AfdelingModel> afdelingModel =
          afdelingModelResponse.afdelingModel ?? AfdelingModel();

      await localDataSource.deleteAfdeling();

      for (var afd in afdelingModel) {
        localDataSource.addAfdeling(afd);
      }

      emit(SuccessSyncMasterdataState(
          message: 'Berhasil Mengupdate Masterdata Afdeling.'));
    } catch (e) {
      emit(ErrorSyncMasterdataState('Oops, Periksa Koneksi Anda'));
    }
  }

  refreshDataBlok() async {
    try {
      emit(LoadingSyncMasterdataState());
      final UserModel user =
          await localDataSource.getCurrentUser() ?? UserModel();

      var blokModelResponse = await RemoteDataSource().getBlokData(
          user.psa.toString(),
          user.company_code.toString(),
          user.token.toString());

      List<BlokModel> blokModel = blokModelResponse.blokModel ?? BlokModel();

      await localDataSource.deleteBlok();

      for (var blok in blokModel) {
        localDataSource.addBlok(blok);
      }

      emit(SuccessSyncMasterdataState(
          message: 'Berhasil Mengupdate Masterdata Blok.'));
    } catch (e) {
      emit(ErrorSyncMasterdataState('Oops, Periksa Koneksi Anda'));
    }
  }

  refreshDataMandor() async {
    try {
      emit(LoadingSyncMasterdataState());
      final UserModel user =
          await localDataSource.getCurrentUser() ?? UserModel();

      var mandorModelResponse = await RemoteDataSource()
          .getMandorByPsa(user.psa.toString(), user.token.toString());

      List<MandorModel> mandorModel =
          mandorModelResponse.mandorModel ?? MandorModel();

      await localDataSource.deleteMandor();

      for (var mandor in mandorModel) {
        localDataSource.addMandor(mandor);
      }

      emit(SuccessSyncMasterdataState(
          message: 'Berhasil Mengupdate Masterdata Mandor.'));

      // await localDataSource.deleteMandor();
      // await localDataSource.deletePemanen();
    } catch (e) {
      emit(ErrorSyncMasterdataState('Oops, Periksa Koneksi Anda'));
    }
  }

  refreshDataPemanen() async {
    try {
      emit(LoadingSyncMasterdataState());
      final UserModel user =
          await localDataSource.getCurrentUser() ?? UserModel();

      // Get data pemanen dari server
      var pemanenModelResponse = await RemoteDataSource()
          .getPemanenByPsa(user.psa.toString(), user.token.toString());

      List<PemanenModel> pemanenModel =
          pemanenModelResponse.pemanenModel ?? PemanenModel();

      await localDataSource.deletePemanen();

      for (var pemanen in pemanenModel) {
        localDataSource.addPemanen(pemanen);
      }

      emit(SuccessSyncMasterdataState(
          message: 'Berhasil Mengupdate Masterdata Pemanen.'));
    } catch (e) {
      emit(ErrorSyncMasterdataState('Oops, Periksa Koneksi Anda'));
    }
  }
}




// insert ke lokal database
        // await localDataSource.addUser(userModel);
      
       
        // for (var mandor in mandorModel) {
        //   localDataSource.addMandor(mandor);
        // }
        // for (var pemanen in pemanenModel) {
        //   localDataSource.addPemanen(pemanen);
        // }