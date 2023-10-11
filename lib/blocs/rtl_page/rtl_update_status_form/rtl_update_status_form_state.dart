part of 'rtl_update_status_form_cubit.dart';

@immutable
abstract class RtlUpdateStatusFormState {}

class InitialRtlUpdateStatusFormState extends RtlUpdateStatusFormState {}

class LoadingRtlUpdateStatusFormState extends RtlUpdateStatusFormState {}

class SuccessRtlUpdateStatusFormState extends RtlUpdateStatusFormState {
  final int status_code;
  final String message;
  SuccessRtlUpdateStatusFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRtlUpdateStatusFormState extends RtlUpdateStatusFormState {
  final int status_code;
  final String message;
  DuplicatedRtlUpdateStatusFormState(
      {required this.status_code, required this.message});
}

class ErrorRtlUpdateStatusFormState extends RtlUpdateStatusFormState {
  final String? message;

  ErrorRtlUpdateStatusFormState(this.message);
}
