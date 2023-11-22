import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/kondisi_pks_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_kondisi_pks_state.dart';

class SelectboxKondisiPksCubit extends Cubit<SelectboxKondisiPksState> {
  SelectboxKondisiPksCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxKondisiPksState SelectboxKondisiPksState) {
    emit(SelectboxKondisiPksState);
  }

  Future<List<KondisiPksModel>> getData() async {
    KondisiPksModelResponse response;
    List<KondisiPksModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response =
        await remoteDataSource.getAllKondisiPks(userModel.token.toString());
    data = response.kondisiPksModel;
    print('data apa KondisiPks $data');

    return data;
  }
}
