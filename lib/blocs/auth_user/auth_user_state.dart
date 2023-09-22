part of 'auth_user_cubit.dart';

@immutable
abstract class AuthUserState {}

class AuthUserInitial extends AuthUserState {}

class AuthUserLoadingState extends AuthUserState {}

class AuthUserErrorState extends AuthUserState {
  final String? message;

  AuthUserErrorState(this.message);
}

class AuthUserNotActiveState extends AuthUserState {
  final String? message;

  AuthUserNotActiveState(this.message);
}

class AuthUserSuccessState extends AuthUserState {
  final UserModel? userModel;
  final TypeUserState typeUserState;

  AuthUserSuccessState(this.userModel, this.typeUserState);
}
