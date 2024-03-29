part of 'page_cubit.dart';

@immutable
abstract class PageState {}

class SplashPageState extends PageState {}

class OnBoardingPageState extends PageState {}

class LoginPageState extends PageState {}

class HomePageState extends PageState {
  final UserModel userModel;

  HomePageState(this.userModel);
}

class HasNewUpdate extends PageState {}

class NoUpdate extends PageState {}
