import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/analisa_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/penyelesaian_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'penyelesaian_kerusakan_alat_list_state.dart';

class PenyelesaiankerusakanAlatListCubit extends Cubit<PenyelesaianKerusakanAlatListState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PenyelesaiankerusakanAlatListCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingPenyelesaianKerusakanAlatListLState());

  getData(PelaporanKerusakanAlatFormModel dataFormPenyelesaianKerusakanAlat) async {
    print('asdasdsa ${dataFormPenyelesaianKerusakanAlat.rowstamp}');
    emit(LoadingPenyelesaianKerusakanAlatListLState());
    UserModel userModel = await localDataSource.getCurrentUser();
    PenyelesaianKerusakanAlatListModelSelectResponse data =
        await remoteDataSource.getDataListPenyelesaianKerusakanAlatByRowstampAcuan(
            dataFormPenyelesaianKerusakanAlat.rowstamp.toString(), userModel.token);
   print('update data nih666 ${data}');

    // if (data.dataForm.isEmpty) {
    //   emit(NoDataPenyelesaiankerusakanAlatListState(dataFormRtl, data.dataForm, userModel));
    // } else {
    emit(SuccessPenyelesaianKerusakanAlatListState(dataFormPenyelesaianKerusakanAlat, data.dataForm, userModel));
    // }
  }
}
