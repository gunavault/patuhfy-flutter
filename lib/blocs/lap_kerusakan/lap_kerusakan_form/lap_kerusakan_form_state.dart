part of 'lap_kerusakan_form_cubit.dart';

@immutable
abstract class LapKerusakanFormState {}

class InitialLapKerusakanFormState extends LapKerusakanFormState {}

class LoadingLapKerusakanFormState extends LapKerusakanFormState {}

class SuccessLapKerusakanFormState extends LapKerusakanFormState {
  final int status_code;
  final String message;
  SuccessLapKerusakanFormState({required this.status_code, required this.message});
}

class DuplicatedLapKerusakanFormState extends LapKerusakanFormState {
  final int status_code;
  final String message;
  DuplicatedLapKerusakanFormState(
      {required this.status_code, required this.message});
}

class ErrorLapKerusakanFormState extends LapKerusakanFormState {
  final String? message;

  ErrorLapKerusakanFormState(this.message);
}
