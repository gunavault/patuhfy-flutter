import 'package:bloc/bloc.dart';
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

    UserModel userModel = await localDataSource.getCurrentUser();
    String nikSap = userModel.nik_sap.toString();
    String psa = userModel.psa.toString();
    String role = userModel.role.toString();

    RtlListModelSelectResponse data = await remoteDataSource
        .getDataListRtlByPsa(psa, nikSap, status, role, userModel.token);

    print('data pencurian tsb $data');
    emit(SuccessRtlListListState(data.dataForm));
  }
}
