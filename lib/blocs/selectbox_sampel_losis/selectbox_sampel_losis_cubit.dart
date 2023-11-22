import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/m_sampel_losis_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_sampel_losis_state.dart';

class SelectboxSampelLosisCubit extends Cubit<SelectboxSampelLosisState> {
  SelectboxSampelLosisCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxSampelLosisState SelectboxSampelLosisState) {
    emit(SelectboxSampelLosisState);
  }

  // getData() async {
  //   emit(LoadingState());
  //   List<SampelLosisModel> data;

  //   data = await localDataSource.getAllSampelLosis();
  //   emit(SuccessState(data));
  // }

  Future<List<SampelLosisModel>> getData() async {
    SampelLosisModelResponse response;
    List<SampelLosisModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource.getSampelLosis(userModel.token.toString());
    data = response.sampellosisModel;
    print('data apa SampelLosis $data');

    return data;
  }
}
