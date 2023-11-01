import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/peroftma_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'performa_state.dart';

class PerformaCubit extends Cubit<PerformaState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PerformaCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingPerformaListState());

  getData() async {
    UserModel userModel = await localDataSource.getCurrentUser();

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database
    if (connectivityResult != ConnectivityResult.none) {
      emit(LoadingPerformaListState());
      String nikSap = userModel.nik_sap.toString();

      PerformaModelSelectResponse data =
          await remoteDataSource.getdataperforma(nikSap, userModel.token);

      print('data performa $data');
      emit(SuccessPerformaListState(data.dataForm, userModel));
    } else {
      // emit(LoadingPerformaListState());
      emit(SuccessPerformaListState(
          PerformaModel(
              APEL_PAGI: '0',
              HARI_PRODUKTIF: '0',
              INSPEKSI_HANCA: '0',
              INSPEKSI_TPH: '0',
              PERSEN_TASK: 0.0),
          userModel));
    }
  }
}
