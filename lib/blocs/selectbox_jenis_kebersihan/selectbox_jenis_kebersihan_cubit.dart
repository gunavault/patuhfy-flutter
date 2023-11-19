import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/jenis_kebersihan_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_jenis_kebersihan_state.dart';

class SelectboxJenisKebersihanCubit
    extends Cubit<SelectboxJenisKebersihanState> {
  SelectboxJenisKebersihanCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxJenisKebersihanState SelectboxJenisKebersihanState) {
    emit(SelectboxJenisKebersihanState);
  }

  Future<List<JenisKebersihanModel>> getData() async {
    JenisKebersihanModelResponse response;
    List<JenisKebersihanModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource
        .getAllJenisKebersihan(userModel.token.toString());
    data = response.jenisKebersihanModel;
    print('data apa JenisKebersihan $data');

    return data;
  }
}
