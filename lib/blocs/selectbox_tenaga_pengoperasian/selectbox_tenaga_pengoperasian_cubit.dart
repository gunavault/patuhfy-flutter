import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/tenaga_pengoperasian_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_tenaga_pengoperasian_state.dart';

class SelectboxTenagaPengoperasianCubit
    extends Cubit<SelectboxTenagaPengoperasianState> {
  SelectboxTenagaPengoperasianCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(
      SelectboxTenagaPengoperasianState SelectboxTenagaPengoperasianState) {
    emit(SelectboxTenagaPengoperasianState);
  }

  Future<List<TenagaPengoperasianModel>> getData() async {
    TenagaPengoperasianModelResponse response;
    List<TenagaPengoperasianModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource
        .getAllTenagaPengoperasian(userModel.token.toString());
    data = response.tenagaPengoperasianModel;
    print('data apa TenagaPengoperasian $data');

    return data;
  }
}
