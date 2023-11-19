import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/kondisi_proses_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_kondisi_proses_state.dart';

class SelectboxKondisiProsesCubit extends Cubit<SelectboxKondisiProsesState> {
  SelectboxKondisiProsesCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxKondisiProsesState SelectboxKondisiProsesState) {
    emit(SelectboxKondisiProsesState);
  }

  Future<List<KondisiProsesModel>> getData() async {
    KondisiProsesModelResponse response;
    List<KondisiProsesModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response =
        await remoteDataSource.getAllKondisiProses(userModel.token.toString());
    data = response.kondisiProsesModel;
    print('data apa KondisiProses $data');

    return data;
  }
}
