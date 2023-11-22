part of 'cek_sampel_ipal_form_cubit.dart';

@immutable
abstract class CekMonitoringIpalFormState {}

class InitialCekMonitoringIpalFormState extends CekMonitoringIpalFormState {}

class LoadingCekMonitoringIpalFormState extends CekMonitoringIpalFormState {}

class SuccessCekMonitoringIpalFormState extends CekMonitoringIpalFormState {
  final int status_code;
  final String message;
  SuccessCekMonitoringIpalFormState(
      {required this.status_code, required this.message});
}

class DuplicatedCekMonitoringIpalFormState extends CekMonitoringIpalFormState {
  final int status_code;
  final String message;
  DuplicatedCekMonitoringIpalFormState(
      {required this.status_code, required this.message});
}

class ErrorCekMonitoringIpalFormState extends CekMonitoringIpalFormState {
  final String? message;

  ErrorCekMonitoringIpalFormState(this.message);
}

class NoConnectionCekMonitoringIpalFormState extends CekMonitoringIpalFormState {
  NoConnectionCekMonitoringIpalFormState();
}
