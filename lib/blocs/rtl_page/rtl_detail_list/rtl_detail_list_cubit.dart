import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'rtl_detail_list_state.dart';

class RtlDetailListCubit extends Cubit<RtlDetailListState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  RtlDetailListCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingRtlDetailListListState());

  getData(RtlListModel dataFormRtl) async {
    emit(LoadingRtlDetailListListState());
    UserModel userModel = await localDataSource.getCurrentUser();
    RtlDetailListModelSelectResponse data =
        await remoteDataSource.getDataListRtlDetailByRowstampAcuan(
            dataFormRtl.rowstamp.toString(), userModel.token);

    if (data.dataForm.length == 0) {
      emit(NoDataRtlDetailListListState(dataFormRtl));
    } else {
      emit(SuccessRtlDetailListListState(dataFormRtl, data.dataForm));
    }
    print('data pencurian tsb $data');
  }
}
