part of 'estetika_pabrik_form_cubit.dart';

@immutable
abstract class CekSampelLosisFormState {}

class InitialCekSampelLosisFormState extends CekSampelLosisFormState {}

class LoadingCekSampelLosisFormState extends CekSampelLosisFormState {}

class SuccessCekSampelLosisFormState extends CekSampelLosisFormState {
  final int status_code;
  final String message;
  SuccessCekSampelLosisFormState(
      {required this.status_code, required this.message});
}

class DuplicatedCekSampelLosisFormState extends CekSampelLosisFormState {
  final int status_code;
  final String message;
  DuplicatedCekSampelLosisFormState(
      {required this.status_code, required this.message});
}

class ErrorCekSampelLosisFormState extends CekSampelLosisFormState {
  final String? message;

  ErrorCekSampelLosisFormState(this.message);
}

class NoConnectionCekSampelLosisFormState extends CekSampelLosisFormState {
  NoConnectionCekSampelLosisFormState();
}
