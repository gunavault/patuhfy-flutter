part of 'auth_session_cubit.dart';

@immutable
abstract class AuthUserSessionState {}

class AuthUserSessionInitial extends AuthUserSessionState {}

class AuthUserSessionLoadingState extends AuthUserSessionState {}

class AuthUserSessionErrorState extends AuthUserSessionState {
  final String? message;

  AuthUserSessionErrorState(this.message);
}

class AuthUserSessionNotActiveState extends AuthUserSessionState {
  final String? message;

  AuthUserSessionNotActiveState(this.message);
}

class AuthUserSessionUpdatedState extends AuthUserSessionState {
  final UserModel? userModel;
  // final TypeUserState typeUserState;

  AuthUserSessionUpdatedState(this.userModel);
}
