import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/alat_by_stasiun_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_alat_by_stasiun_state.dart';

class SelectboxAlatByStasiunCubit extends Cubit<SelectboxAlatByStasiunState> {
  SelectboxAlatByStasiunCubit(this.localDataSource, this.remoteDataSource)
      : super(SetParamSBState(''));

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setParam(String kodeStasiun) {
    emit(SetParamSBState(kodeStasiun));
  }

  Future<List<AlatByStasiunModel>> getData(String kodeStasiun) async {
    AlatByStasiunModelResponse response;
    List<AlatByStasiunModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource.getAlatByStasiun(
        userModel.token.toString(), kodeStasiun);
    data = response.alatByStasiunModel;

    return data;
  }

  // getDataFilter(kodePsa, kodeAfd, filter) async {
  //   // emit(LoadingSbAlatByStasiunState());
  //   List<AlatByStasiunModel> data;

  //   data = await localDataSource.getAllAlatByStasiunByKodeAfdFilter(
  //       kodePsa, kodeAfd, filter);

  //   return data;
  //   // print('data AlatByStasiunkk ${data}');
  //   // emit(SuccessSbAlatByStasiunState(data));
  // }
}
