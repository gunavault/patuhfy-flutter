part of 'performa_cubit.dart';

@immutable
abstract class PerformaState {}

class LoadingPerformaListState extends PerformaState {}

class SuccessPerformaListState extends PerformaState {
  final PerformaModel dataForm;
  final UserModel userModel;

  SuccessPerformaListState(this.dataForm, this.userModel);
}
