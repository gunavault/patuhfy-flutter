import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/entities/user_model_entity.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'apel_pagi_form_state.dart';

class ApelPagiFormCubit extends Cubit<ApelPagiFormState> {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  ApelPagiFormCubit(this.localDataSource, this.remoteDataSource)
      : super(InitialApelPagiFormState());

  submitToDatabase(ApelPagiFormModel dataForm) async {
    try {
      emit(LoadingApelPagiFormState());
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      DateTime dateToday = new DateTime.now();
      String today = dateToday.toString().substring(0, 10);

      UserModel userModel = await localDataSource.getCurrentUser();
      dataForm.createdBy = userModel.nik_sap;
      dataForm.tanggal = today;
      dataForm.company = userModel.company_code;
      dataForm.unitKerja = userModel.psa;

      print('dataForm APel ${dataForm}');
      // check if there is no internet post only to local

      // Check if there is connection post to local and database

      // localDataSource.afdelingDao.insertAfdeling(afd);

      // ApelPagiFormModelResponse result = await remoteDataSource.createApelPagi(
      //   userModel.token,
      //   dataFormApelPagi,
      // );
      // if (result.statusCode == 200) {
      //   // emit(SuccessApelPagiFormState(result.data));
      // } else {
      //   // emit(ErrorApelPagiFormState(result.msg));
      // }
    } catch (err) {
      print('error ${err.toString()}');
      // emit(ErrorApelPagiFormState(err.toString()));
    }
  }

  // createApelPagi(
  //     ApelPagiFormModel dataFormApelPagi, String kode_sales_order) async {

  // }
}
