import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/peroftma_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'performa_state.dart';

class PerformaCubit extends Cubit<PerformaState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PerformaCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingPerformaListState());

  getData() async {
    emit(LoadingPerformaListState());

    UserModel userModel = await localDataSource.getCurrentUser();
    String nikSap = userModel.nik_sap.toString();

    PerformaModelSelectResponse data = await remoteDataSource
        .getdataperforma(nikSap,userModel.token);

    print('data performa $data');
    emit(SuccessPerformaListState(data.dataForm, userModel));
  }
}
