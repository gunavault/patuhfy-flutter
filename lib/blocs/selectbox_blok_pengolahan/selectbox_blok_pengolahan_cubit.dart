import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/m_jenis_losis_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_blok_pengolahan_state.dart';

class SelectboxBlokPengolahanCubit extends Cubit<SelectboxBlokPengolahanState> {
  SelectboxBlokPengolahanCubit(this.localDataSource,this.remoteDataSource) : super(SetParamSBState('',''));

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setParam(String kodepsa, String kodeafd) {
    emit(SetParamSBState(kodepsa, kodeafd));
  }

  Future<List<BlokModel>> getData(kodepsa, kodeafd) async {
    BlokModelResponse response;

    List<BlokModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    print('ini dia kode psa $kodepsa');
    print('ini dia kode afd $kodeafd');
    response = await remoteDataSource.getBlokDataAfd(
         kodepsa,userModel.company_code.toString(), kodeafd,userModel.token.toString());

        data = response.blokModel!;

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
