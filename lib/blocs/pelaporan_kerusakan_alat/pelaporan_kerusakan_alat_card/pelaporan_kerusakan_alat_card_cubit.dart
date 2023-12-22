import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'pelaporan_kerusakan_alat_card_state.dart';

class PelaporanKerusakanAlatCardCubit
    extends Cubit<PelaporanKerusakanAlatCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PelaporanKerusakanAlatCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsPelaporanKerusakanAlatAswered(false, null));

  checkIsAnwered(String taskDate) async {
    // List<PelaporanKerusakanAlatFormModel> cekData;
    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database

    if (connectivityResult != ConnectivityResult.none) {
      // Jika data 0 lokal data, cek ke online
      UserModel userModel = await localDataSource.getCurrentUser();

      PelaporanKerusakanAlatFormModelSelectResponse response =
          await RemoteDataSource().getPelaporanKerusakanAlatByTanggal(
              userModel.psa.toString(), userModel, userModel.token);
      print('data dari remote ${response.dataForm.length}');
      if (response.dataForm.length > 0) {
        print('kesini');
        emit(IsPelaporanKerusakanAlatAswered(true, response.dataForm.first));
      } else {
        emit(IsPelaporanKerusakanAlatAswered(false, null));
      }
    } else {
      // Jika Offline
      emit(IsPelaporanKerusakanAlatAswered(false, null));
    }
  }
}
