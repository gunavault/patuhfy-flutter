import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/blocs/type_user/type_user_cubit.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/afdeling_model.dart';
import 'package:patuhfy/models/form_login_model.dart';
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
      print('lessthan');
      var userModelRespone = await RemoteDataSource()
          .login(formLoginModel.nik_sap, formLoginModel.password);
      print('tambahan');
      var afdelingModelResponse = await RemoteDataSource().getAfdelingData(
          userModelRespone.userModel!.psa, userModelRespone.userModel!.token);
      print('tambahan 2');
      if (userModelRespone.userModel != null &&
          userModelRespone.userModel!.role != "") {
        var userModel = userModelRespone.userModel ?? UserModel();
        print('ini lewat');
        List<AfdelingModel> afdelingModel =
            afdelingModelResponse.afdelingModel ?? AfdelingModel();
        print('ini lewat juga ${afdelingModel}');
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString(keyNikSap, userModel.nik_sap ?? "");
        localDataSource.addUser(userModel);
        afdelingModel.forEach((afd) => localDataSource.addAfdeling(afd));

        print('sukses nih');

        emit(
          AuthUserSuccessState(
            userModel,
            TypeAskepState(),
          ),
        );
      } else if (userModelRespone.userModel != null &&
          userModelRespone.userModel!.role == "") {
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
