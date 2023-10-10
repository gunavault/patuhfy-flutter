part of 'real_pemeliharaan_jalan_form_cubit.dart';

@immutable
abstract class RealPemeliharaanJalanFormState {}

class InitialRealPemeliharaanJalanFormState extends RealPemeliharaanJalanFormState {}

class LoadingRealPemeliharaanJalanFormState extends RealPemeliharaanJalanFormState {}

class SuccessRealPemeliharaanJalanFormState extends RealPemeliharaanJalanFormState {
  final int status_code;
  final String message;
  SuccessRealPemeliharaanJalanFormState(
      {required this.status_code, required this.message});
}

class DuplicatedRealPemeliharaanJalanFormState extends RealPemeliharaanJalanFormState {
  final int status_code;
  final String message;
  DuplicatedRealPemeliharaanJalanFormState(
      {required this.status_code, required this.message});
}

class ErrorRealPemeliharaanJalanFormState extends RealPemeliharaanJalanFormState {
  final String? message;

  ErrorRealPemeliharaanJalanFormState(this.message);
}
