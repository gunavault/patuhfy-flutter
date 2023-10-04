part of 'pencurian_tbs_list_cubit.dart';

@immutable
abstract class PencurianTbsListState {}

class LoadingPencurianTbsListState extends PencurianTbsListState {}

class SuccessPencurianTbsListState extends PencurianTbsListState {
  final List<PencurianTbsFormModel> dataForm;

  SuccessPencurianTbsListState(this.dataForm);
}
