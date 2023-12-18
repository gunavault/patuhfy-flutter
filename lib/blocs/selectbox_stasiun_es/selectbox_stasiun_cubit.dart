import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/stasiun_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_stasiun_state.dart';

class SelectboxStasiunESCubit extends Cubit<SelectboxStasiunESState> {
  SelectboxStasiunESCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxStasiunESState SelectboxStasiunESState) {
    emit(SelectboxStasiunESState);
  }

  // getData() async {
  //   emit(LoadingState());
  //   List<StasiunModel> data;

  //   data = await localDataSource.getAllStasiun();
  //   emit(SuccessState(data));
  // }

  Future<List<StasiunModel>> getData() async {
    StasiunModelResponse response;
    List<StasiunModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource.getAllStasiunES(userModel.token.toString());
    data = response.stasiunModel;
    print('data apa stasiun $data');

    return data;
  }
}
