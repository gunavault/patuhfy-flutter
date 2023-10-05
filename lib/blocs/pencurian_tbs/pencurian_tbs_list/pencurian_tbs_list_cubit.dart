import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';

part 'pencurian_tbs_list_state.dart';

class PencurianTbsListCubit extends Cubit<PencurianTbsListState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  PencurianTbsListCubit(this.localDataSource, this.remoteDataSource)
      : super(LoadingPencurianTbsListState());

  getData(String tanggal) async {
    List<PencurianTbsFormModel> data;
    print('dihit nih');
    data = await localDataSource.getDataPencurianTbsByTanggal(tanggal);
    print('data pencurian tsb $data');
    emit(SuccessPencurianTbsListState(data));
  }
}
