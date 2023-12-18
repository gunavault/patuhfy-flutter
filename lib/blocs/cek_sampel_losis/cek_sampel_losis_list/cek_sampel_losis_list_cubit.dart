import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'cek_sampel_losis_list_state.dart';

class CekSampelLosisListCubit extends Cubit<CekSampelLosisListState> {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  CekSampelLosisListCubit(this.localDataSource,this.remoteDataSource)
      : super(LoadingCekSampelLosisListState());

  // getData(String tanggal) async {
  //   List<CekSampelLosisFormModel> dataform;
  //   print('dihit nih');
  //   dataform = await remoteDataSource.getCekSampelLosisByTanggal(tanggal);
  //   print('data pencurian tsb $data');
  //   emit(SuccessCekSampelLosisListState(data));
  // }
    Future<List<CekSampelLosisFormModel>> getData(String tanggal) async {
    CekSampelLosisFormModelSelectResponse response;
    List<CekSampelLosisFormModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource.getCekSampelLosisByTanggal(tanggal, userModel.nik_sap.toString(), userModel.token.toString());
    data = response.dataForm;
    print('data apa CekSampelLosis $data');

    emit(SuccessCekSampelLosisListState(data));

    return data;
  }
}
