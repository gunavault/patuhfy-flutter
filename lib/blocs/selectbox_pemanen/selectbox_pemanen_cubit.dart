import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_pemanen_state.dart';

class SelectboxPemanenCubit extends Cubit<SelectboxPemanenState> {
  SelectboxPemanenCubit(this.localDataSource) : super(SetParamSBState(''));

  final LocalDataSource localDataSource;

  setParam(String kodeMandor) {
    emit(SetParamSBState(kodeMandor));
  }

  Future<List<PemanenModel>> getData(String kodeMandor) async {
    List<PemanenModel> data;
    data = await localDataSource.getPemanenByMandor(kodeMandor);
    print('kodemandor di getData ${kodeMandor}');
    return data;
  }

  // getDataFilter(kodePsa, kodeAfd, filter) async {
  //   // emit(LoadingSbPemanenState());
  //   List<PemanenModel> data;

  //   data = await localDataSource.getAllPemanenByKodeAfdFilter(
  //       kodePsa, kodeAfd, filter);

  //   return data;
  //   // print('data Pemanenkk ${data}');
  //   // emit(SuccessSbPemanenState(data));
  // }
}
