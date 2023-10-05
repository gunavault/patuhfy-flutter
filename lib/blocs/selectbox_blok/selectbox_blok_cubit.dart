import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_blok_state.dart';

class SelectboxBlokCubit extends Cubit<SelectboxBlokState> {
  SelectboxBlokCubit(this.localDataSource) : super(SetParamSBState(''));

  final LocalDataSource localDataSource;

  setParam(String kodeAfd) {
    emit(SetParamSBState(kodeAfd));
  }

  Future<List<BlokModel>> getData(kodeAfd) async {
    List<BlokModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    print('aww kodeAfd $kodeAfd');
    data = await localDataSource.getAllBlokByKodeAfd(
        userModel.psa.toString(), kodeAfd);

    return data;
  }

  getDataFilter(kodePsa, kodeAfd, filter) async {
    // emit(LoadingSbBlokState());
    List<BlokModel> data;

    data = await localDataSource.getAllBlokByKodeAfdFilter(
        kodePsa, kodeAfd, filter);

    return data;
    // print('data blokkk ${data}');
    // emit(SuccessSbBlokState(data));
  }
}
