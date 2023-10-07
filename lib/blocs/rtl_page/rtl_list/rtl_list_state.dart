part of 'rtl_list_cubit.dart';

@immutable
abstract class RtlListListState {}

class LoadingRtlListListState extends RtlListListState {}

class SuccessRtlListListState extends RtlListListState {
  final List<RtlListModel> dataForm;

  SuccessRtlListListState(this.dataForm);
}
