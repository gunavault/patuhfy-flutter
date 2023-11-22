import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'pelaporan_kerusakan_alat_list_state.dart';

class PelaporanKerusakanAlatListCubit
    extends Cubit<PelaporanKerusakanAlatListState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PelaporanKerusakanAlatListCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingPelaporanKerusakanAlatListState());

  getData() async {
    emit(LoadingPelaporanKerusakanAlatListState());
    UserModel userModel = await localDataSource.getCurrentUser();
    PelaporanKerusakanAlatListModelSelectResponse response =
        await remoteDataSource.getPelaporanKerusakanAlatByCreatedBy(
            '', userModel.nik_sap, userModel.token);

    List<PelaporanKerusakanAlatFormModel> data = response.dataForm;

    print('apa neeeeeee $response');
    if (response.status_code == 200) {
      emit(SuccessPelaporanKerusakanAlatListState(data, userModel));
    } else {
      emit(NoDataPelaporanKerusakanAlatListState([], userModel));
    }
    print('update data nih');

    // if (data.dataForm.isEmpty) {
    //   emit(NoDataPelaporanKerusakanAlatListState(dataFormRtl, data.dataForm, userModel));
    // } else {

    // }
  }
}
