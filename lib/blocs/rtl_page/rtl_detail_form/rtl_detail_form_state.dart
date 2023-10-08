part of 'rtl_detail_form_cubit.dart';

@immutable
abstract class RtlDetailFormState {}

class InitialRtlDetailFormState extends RtlDetailFormState {}

class LoadingRtlDetailFormState extends RtlDetailFormState {}

class SuccessRtlDetailFormState extends RtlDetailFormState {
  final int status_code;
  final String message;
  SuccessRtlDetailFormState({required this.status_code, required this.message});
}

class DuplicatedRtlDetailFormState extends RtlDetailFormState {
  final int status_code;
  final String message;
  DuplicatedRtlDetailFormState(
      {required this.status_code, required this.message});
}

class ErrorRtlDetailFormState extends RtlDetailFormState {
  final String? message;

  ErrorRtlDetailFormState(this.message);
}
