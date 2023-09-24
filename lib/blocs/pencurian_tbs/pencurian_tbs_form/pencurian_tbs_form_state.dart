part of 'pencurian_tbs_form_cubit.dart';

@immutable
abstract class PencurianTbsFormState {}

class InitialPencurianTbsFormState extends PencurianTbsFormState {}

class LoadingPencurianTbsFormState extends PencurianTbsFormState {}

class SuccessPencurianTbsFormState extends PencurianTbsFormState {
  final int status_code;
  final String message;
  SuccessPencurianTbsFormState(
      {required this.status_code, required this.message});
}

class DuplicatedPencurianTbsFormState extends PencurianTbsFormState {
  final int status_code;
  final String message;
  DuplicatedPencurianTbsFormState(
      {required this.status_code, required this.message});
}

class ErrorPencurianTbsFormState extends PencurianTbsFormState {
  final String? message;

  ErrorPencurianTbsFormState(this.message);
}
