import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/models/user_model.dart';

part 'estetika_pabrik_list_state.dart';

class EstetikaPabrikListCubit extends Cubit<EstetikaPabrikListState> {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  EstetikaPabrikListCubit(this.localDataSource,this.remoteDataSource)
      : super(LoadingEstetikaPabrikListState());

  // getData(String tanggal) async {
  //   List<EstetikaPabrikFormModel> dataform;
  //   print('dihit nih');
  //   dataform = await remoteDataSource.getEstetikaPabrikByTanggal(tanggal);
  //   print('data pencurian tsb $data');
  //   emit(SuccessEstetikaPabrikListState(data));
  // }
    Future<List<EstetikaPabrikFormModel>> getData(String tanggal) async {
    EstetikaPabrikFormModelSelectResponse response;
    List<EstetikaPabrikFormModel> data;
    UserModel userModel = await localDataSource.getCurrentUser();
    response = await remoteDataSource.getEstetikaPabrikByTanggal(tanggal, userModel.nik_sap.toString(), userModel.token.toString());
    data = response.dataForm;
    print('data apa EstetikaPabrik $data');

    emit(SuccessEstetikaPabrikListState(data));

    return data;
  }
}
