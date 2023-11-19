import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/jenis_kebersihan_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/models/waktu_pengamatan_model.dart';

part 'selectbox_waktu_pengamatan_state.dart';

class SelectboxWaktuPengamatanCubit
    extends Cubit<SelectboxWaktuPengamatanState> {
  SelectboxWaktuPengamatanCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingState());

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  setTypeUser(SelectboxWaktuPengamatanState SelectboxWaktuPengamatanState) {
    emit(SelectboxWaktuPengamatanState);
  }

  Future<List<WaktuPengamatanModel>> getData() async {
    WaktuPengamatanModelResponse response;
    List<WaktuPengamatanModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource
        .getAllWaktuPengamatan(userModel.token.toString());
    data = response.waktuPengamatanModel;
    print('data apa WaktuPengamatan $data');

    return data;
  }
}
