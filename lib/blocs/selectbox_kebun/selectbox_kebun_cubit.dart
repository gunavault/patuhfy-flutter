import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/kebun_model.dart';
import 'package:patuhfy/models/m_sampel_losis_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'selectbox_kebun_state.dart';

class SelectboxKebunCubit extends Cubit<SelectboxKebunState> {
  SelectboxKebunCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxKebunState SelectboxKebunState) {
    emit(SelectboxKebunState);
  }

  // getData() async {
  //   emit(LoadingState());
  //   List<KebunModel> data;

  //   data = await localDataSource.getAllKebun();
  //   emit(SuccessState(data));
  // }

  Future<List<KebunModel>> getData() async {
    KebunModelResponse response;
    List<KebunModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource.getKebunByCompany(userModel.token.toString(), userModel.company_code.toString());

    data = response.Kebunmodel;
    print('data apa Kebun $data');

    return data;
  }
}
