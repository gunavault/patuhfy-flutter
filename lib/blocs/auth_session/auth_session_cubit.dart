import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patuhfy/blocs/type_user/type_user_cubit.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_session_state.dart';

class AuthSessionCubit extends Cubit<AuthUserSessionState> {
  final LocalDataSource localDataSource;
  AuthSessionCubit(this.localDataSource) : super(AuthUserSessionInitial());

  getUser() async {
    try {
      emit(AuthUserSessionLoadingState());
      UserModel currentUser = await localDataSource.getCurrentUser();
      emit(
        AuthUserSessionUpdatedState(
          currentUser,
        ),
      );
    } catch (err) {
      emit(AuthUserSessionErrorState("$err"));
    }
  }

  typeUserStringToState(typeUser) {
    if (typeUser == "ADMIN_HOLDING") {
      return TypeAskepState();
    } else {
      return TypeManagerState();
    }
  }
}
