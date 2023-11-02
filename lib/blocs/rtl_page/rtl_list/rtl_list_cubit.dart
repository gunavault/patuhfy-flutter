import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'rtl_list_state.dart';

class RtlListCubit extends Cubit<RtlListState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RtlListCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingRtlListListState());

  getData(String status) async {
    emit(LoadingRtlListListState());

    final connectivityResult = await (Connectivity()
        .checkConnectivity()); // cCheck if there is connection post to local and database
    UserModel userModel = await localDataSource.getCurrentUser();
    print('awwwwww');
    if (connectivityResult != ConnectivityResult.none) {
      print('awwwwww ada koneksi');
      String nikSap = userModel.nik_sap.toString();
      String psa = userModel.psa.toString();
      String role = userModel.role.toString();

      RtlListModelSelectResponse data = await remoteDataSource
          .getDataListRtlByPsa(psa, nikSap, status, role, userModel.token);

      print('data pencurian tsb $data');
      emit(SuccessRtlListListState(data.dataForm, userModel));
    } else {
      emit(NoConnectionRtlListListState());
      print('awwwwww tidak ada ada koneksi');
    }
  }
}
