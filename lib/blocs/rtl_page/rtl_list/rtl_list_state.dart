part of 'rtl_list_cubit.dart';

@immutable
abstract class RtlListState {}

class LoadingRtlListListState extends RtlListState {}

class SuccessRtlListListState extends RtlListState {
  final List<RtlListModel> dataForm;

  SuccessRtlListListState(this.dataForm);
}