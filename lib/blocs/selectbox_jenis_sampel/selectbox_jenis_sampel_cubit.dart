import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/m_jenis_losis_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_jenis_sampel_state.dart';

class SelectboxJenisSampelCubit extends Cubit<SelectboxJenisSampelState> {
  SelectboxJenisSampelCubit(this.localDataSource,this.remoteDataSource) : super(SetParamSBState(''));

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setParam(String namasampellosis) {
    emit(SetParamSBState(namasampellosis));
  }

  Future<List<JenisSampelModel>> getData(namasampellosis) async {
    JenisSampelModelResponse response;

    List<JenisSampelModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    print('aww kodelosis $namasampellosis');
    response = await remoteDataSource.getJenisSampel(
        userModel.token.toString(), namasampellosis);

        data = response.sampellosisModel;

    return data;
  }

  // getDataFilter(kodePsa, kodeAfd, filter) async {
  //   // emit(LoadingSbJenisSampelState());
  //   List<JenisSampelModel> data;

  //   data = await remoteDataSource.getJenisSampel(
  //       kodePsa, kodeAfd, filter);

  //   return data;
  //   // print('data JenisSampelkk ${data}');
  //   // emit(SuccessSbJenisSampelState(data));
  // }
}
