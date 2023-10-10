part of 'rtl_detail_update_status_form_cubit.dart';

@immutable
abstract class RtlDetailUpdateStatusFormState {}

class InitialRtlDetailUpdateStatusFormState
    extends RtlDetailUpdateStatusFormState {}

class LoadingRtlDetailUpdateStatusFormState
    extends RtlDetailUpdateStatusFormState {}

class SuccessRtlDetailUpdateStatusFormState
    extends RtlDetailUpdateStatusFormState {
  final int status_code;
  final String message;
  SuccessRtlDetailUpdateStatusFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRtlDetailUpdateStatusFormState
    extends RtlDetailUpdateStatusFormState {
  final int status_code;
  final String message;
  DuplicatedRtlDetailUpdateStatusFormState(
      {required this.status_code, required this.message});
}

class ErrorRtlDetailUpdateStatusFormState
    extends RtlDetailUpdateStatusFormState {
  final String? message;

  ErrorRtlDetailUpdateStatusFormState(this.message);
}
