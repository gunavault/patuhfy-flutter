import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/m_jenis_losis_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_afdeling_pengolahan_state.dart';

class SelectboxAfdelingPengolahanCubit extends Cubit<SelectboxAfdelingPengolahanState> {
  SelectboxAfdelingPengolahanCubit(this.localDataSource,this.remoteDataSource) : super(SetParamSBState(''));

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setParam(String kodepsa) {
    emit(SetParamSBState(kodepsa));
  }

  Future<List<AfdelingModel>> getData(kodepsa) async {
    AfdelingModelResponse response;

    List<AfdelingModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    print('aww kodepsa $kodepsa');
    response = await remoteDataSource.getAfdelingData(kodepsa,
        userModel.token.toString());

        data = response.afdelingModel!;
print('object afdeling ${data}');
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
