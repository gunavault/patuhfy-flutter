import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/analisa_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'analisa_kerusakan_alat_list_state.dart';

class AnalisakerusakanAlatListCubit extends Cubit<AnalisaKerusakanAlatListState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  AnalisakerusakanAlatListCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingAnalisaKerusakanAlatListLState());

  getData(PelaporanKerusakanAlatFormModel dataFormAnalisaKerusakanAlat) async {
    print('asdasdsa ${dataFormAnalisaKerusakanAlat.rowstamp}');
    emit(LoadingAnalisaKerusakanAlatListLState());
    UserModel userModel = await localDataSource.getCurrentUser();
    AnalisaKerusakanAlatListModelSelectResponse data =
        await remoteDataSource.getDataListAnalisaKerusakanAlatByRowstampAcuan(
            dataFormAnalisaKerusakanAlat.rowstamp.toString(), userModel.token);
   print('update data nih666 ${data}');

    // if (data.dataForm.isEmpty) {
    //   emit(NoDataAnalisakerusakanAlatListState(dataFormRtl, data.dataForm, userModel));
    // } else {
    emit(SuccessAnalisaKerusakanAlatListState(dataFormAnalisaKerusakanAlat, data.dataForm, userModel));
    // }
  }
}
