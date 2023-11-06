part of 'rtl_list_cubit.dart';

@immutable
abstract class RtlListState {}

class LoadingRtlListListState extends RtlListState {}

class NoConnectionRtlListListState extends RtlListState {}

class ErrorRtlListListState extends RtlListState {}

class SuccessRtlListListState extends RtlListState {
  final List<RtlListModel> dataForm;
  final UserModel userModel;

  SuccessRtlListListState(this.dataForm, this.userModel);
}
