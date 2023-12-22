import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/jenis_kebersihan_model.dart';
import 'package:patuhfy/models/jenis_kerusakan_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_jenis_kerusakan_state.dart';

class SelectboxJenisKerusakanCubit
    extends Cubit<SelectboxJenisKerusakanState> {
  SelectboxJenisKerusakanCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxJenisKerusakanState SelectboxJenisKerusakanState) {
    emit(SelectboxJenisKerusakanState);
  }

  Future<List<JenisKerusakanModel>> getData() async {
    JenisKerusakanModelResponse response;
    List<JenisKerusakanModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource
        .getAllJenisKerusakan(userModel.token.toString());
    data = response.jeniskerusakanmodel;
    print('data apa JenisKerusakan $data');

    return data;
  }
}
