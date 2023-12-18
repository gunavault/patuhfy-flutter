import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/proses_pengolahan_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'proses_pengolahan_list_state.dart';

class ProsesPengolahanListCubit extends Cubit<ProsesPengolahanListState> {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ProsesPengolahanListCubit(this.localDataSource,this.remoteDataSource)
      : super(LoadingProsesPengolahanListState());

  // getData(String tanggal) async {
  //   List<ProsesPengolahanFormModel> dataform;
  //   print('dihit nih');
  //   dataform = await remoteDataSource.getProsesPengolahanByTanggal(tanggal);
  //   print('data pencurian tsb $data');
  //   emit(SuccessProsesPengolahanListState(data));
  // }
    Future<List<ProsesPengolahanFormModel>> getData(String tanggal) async {
    ProsesPengolahanFormModelSelectResponse response;
    List<ProsesPengolahanFormModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource.getProsesPengolahanByTanggal(tanggal, userModel.nik_sap.toString(), userModel.token.toString());
    data = response.dataForm;
    print('data apa ProsesPengolahan $data');

    emit(SuccessProsesPengolahanListState(data));

    return data;
  }
}
