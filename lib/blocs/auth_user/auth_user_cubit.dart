import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/blocs/type_user/type_user_cubit.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/blok_model.dart';
import 'package:patuhfy/models/form_login_model.dart';
import 'package:patuhfy/models/mandor_model.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_user_state.dart';

class AuthUserCubit extends Cubit<AuthUserState> {
  final LocalDataSource localDataSource;
  AuthUserCubit(this.localDataSource) : super(AuthUserInitial());

  getCurrentUser() async {
    try {
      emit(AuthUserLoadingState());
      UserModel currentUser = await localDataSource.getCurrentUser();
      emit(
        AuthUserSuccessState(
          currentUser,
          typeUserStringToState(currentUser.role),
        ),
      );
    } catch (err) {
      emit(AuthUserErrorState("$err"));
    }
  }

  submitFormLogin(FormLoginModel formLoginModel) async {
    try {
      emit(AuthUserLoadingState());
      // Login ke Server
      var userModelRespone = await RemoteDataSource()
          .login(formLoginModel.nik_sap, formLoginModel.password);
      // Get data afdeling dari server
      var afdelingModelResponse = await RemoteDataSource().getAfdelingData(
          userModelRespone.userModel!.psa, userModelRespone.userModel!.token);
      // Get data blok dari server
      var blokModelResponse = await RemoteDataSource().getBlokData(
          userModelRespone.userModel!.psa.toString(),
          userModelRespone.userModel!.company_code.toString(),
          userModelRespone.userModel!.token.toString());
      // Get data mandor dari server
      var mandorModelResponse = await RemoteDataSource().getMandorByPsa(
          userModelRespone.userModel!.psa.toString(),
          userModelRespone.userModel!.token.toString());
      // Get data pemanen dari server
      var pemanenModelResponse = await RemoteDataSource().getPemanenByPsa(
          userModelRespone.userModel!.psa.toString(),
          userModelRespone.userModel!.token.toString());
      // Check data tidak null
      if (userModelRespone.userModel != null &&
          userModelRespone.userModel!.role != null) {
        var userModel = userModelRespone.userModel ?? UserModel();

        // Inisiasi data afdeling dan blok
        List<AfdelingModel> afdelingModel =
            afdelingModelResponse.afdelingModel ?? AfdelingModel();
        List<BlokModel> blokModel = blokModelResponse.blokModel ?? BlokModel();
        List<MandorModel> mandorModel =
            mandorModelResponse.mandorModel ?? MandorModel();
        List<PemanenModel> pemanenModel =
            pemanenModelResponse.pemanenModel ?? PemanenModel();
        // Simpen NIK SAP dan GeoLocation ke sharedpreferences
        final connectivityResult = await (Connectivity().checkConnectivity());

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(keyNikSap, userModel.nik_sap ?? "");

        // insert ke lokal database
        await localDataSource.addUser(userModel);
        for (var afd in afdelingModel) {
          localDataSource.addAfdeling(afd);
        }
        for (var blok in blokModel) {
          localDataSource.addBlok(blok);
        }
        for (var mandor in mandorModel) {
          localDataSource.addMandor(mandor);
        }
        for (var pemanen in pemanenModel) {
          localDataSource.addPemanen(pemanen);
        }

        print('sukses nih ${userModelRespone.userModel!.role}');
        print('sukses nih userModel ${userModelRespone.userModel}');

        emit(
          AuthUserSuccessState(
            userModel,
            TypeAskepState(),
          ),
        );
      } else if (userModelRespone.userModel != null &&
          userModelRespone.userModel!.role == null) {
        emit(AuthUserNotActiveState("Akun Anda Belum Aktif"));
      } else {
        // Kesini kalo password salah
        print('kesini kah>');
        emit(AuthUserErrorState("maaf user tidak ditemukan"));
      }
    } catch (err) {
      print('error nih bos $err');
      emit(AuthUserErrorState("$err"));
    }
  }

  typeUserStringToState(typeUser) {
    if (typeUser == "ADMIN_HOLDING") {
      return TypeAskepState();
    } else {
      return TypeAskepState();
    }
  }
}

class ResultAuth {
  final bool isAuth = false;
  final String? message;
  final TypeUserState typeUserState;

  ResultAuth(this.typeUserState, {this.message, isAuth});
}
