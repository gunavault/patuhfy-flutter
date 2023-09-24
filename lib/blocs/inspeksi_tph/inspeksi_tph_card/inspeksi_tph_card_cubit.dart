import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';

part 'inspeksi_tph_card_state.dart';

class InspeksiTphCardCubit extends Cubit<InspeksiTphCardState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  InspeksiTphCardCubit(this.localDataSource, this.remoteDataSource)
      : super(IsInspeksiTphAswered(false, null));

  checkIsAnwered(String taskDate) async {
    List<InspeksiTphFormModel> cekData;
    cekData =
        await localDataSource.getDataInspeksiTphByTanggal(taskDate.toString());
    //Check if data offline exists
    print('cek lengh offline ada ga ${cekData.length}');
    if (cekData.length == 0) {
      // if not exist in offline then check online of exists then put to local
      cekData = await localDataSource
          .getDataInspeksiTphByTanggalOnlineOrOffline(taskDate.toString());
      // Cek data online
      print('cek lengh online ada ga ${cekData.length}');
      if (cekData.length == 0) {
        emit(IsInspeksiTphAswered(false, null));
      } else {
        emit(IsInspeksiTphAswered(true, cekData.first));
      }
    } else {
      emit(IsInspeksiTphAswered(true, cekData.first));
    }
  }
}
