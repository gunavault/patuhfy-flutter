part of 'estetika_pabrik_form_cubit.dart';

@immutable
abstract class EstetikaPabrikFormState {}

class InitialEstetikaPabrikFormState extends EstetikaPabrikFormState {}

class LoadingEstetikaPabrikFormState extends EstetikaPabrikFormState {}

class SuccessEstetikaPabrikFormState extends EstetikaPabrikFormState {
  final int status_code;
  final String message;
  SuccessEstetikaPabrikFormState(
      {required this.status_code, required this.message});
}

class DuplicatedEstetikaPabrikFormState extends EstetikaPabrikFormState {
  final int status_code;
  final String message;
  DuplicatedEstetikaPabrikFormState(
      {required this.status_code, required this.message});
}

class ErrorEstetikaPabrikFormState extends EstetikaPabrikFormState {
  final String? message;

  ErrorEstetikaPabrikFormState(this.message);
}

class NoConnectionEstetikaPabrikFormState extends EstetikaPabrikFormState {
  NoConnectionEstetikaPabrikFormState();
}
