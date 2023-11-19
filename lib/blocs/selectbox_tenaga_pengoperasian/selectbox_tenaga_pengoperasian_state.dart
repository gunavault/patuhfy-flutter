part of 'selectbox_tenaga_pengoperasian_cubit.dart';

@immutable
abstract class SelectboxTenagaPengoperasianState {}

class InitialState extends SelectboxTenagaPengoperasianState {}

class LoadingState extends SelectboxTenagaPengoperasianState {}

class SuccessState extends SelectboxTenagaPengoperasianState {
  final List<TenagaPengoperasianModel> listTenagaPengoperasian;
  SuccessState(this.listTenagaPengoperasian);
}

class ErrorState extends SelectboxTenagaPengoperasianState {}
