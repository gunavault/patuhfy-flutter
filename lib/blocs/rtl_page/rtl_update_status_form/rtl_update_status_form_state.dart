part of 'rtl_update_status_form_cubit.dart';

@immutable
abstract class RtlUpdateStatusFormState {}

class InitialRtlUpdateStatusFormState extends RtlUpdateStatusFormState {}

class LoadingRtlUpdateStatusFormState extends RtlUpdateStatusFormState {}

class SuccessRtlUpdateStatusFormState extends RtlUpdateStatusFormState {
  final int status_code;
  final String message;
  final RtlListModel dataRtl;
  SuccessRtlUpdateStatusFormState(
      {required this.status_code,
      required this.message,
      required this.dataRtl});
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
