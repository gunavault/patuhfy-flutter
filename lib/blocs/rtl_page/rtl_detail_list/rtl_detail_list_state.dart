part of 'rtl_detail_list_cubit.dart';

@immutable
abstract class RtlDetailListState {}

class LoadingRtlDetailListListState extends RtlDetailListState {}

class NoDataRtlDetailListListState extends RtlDetailListState {
  final RtlListModel dataFormRtl;

  NoDataRtlDetailListListState(this.dataFormRtl);
}

class SuccessRtlDetailListListState extends RtlDetailListState {
  final RtlListModel dataFormRtl;
  final List<RtlDetailListModel> dataFormRtlDetail;

  SuccessRtlDetailListListState(this.dataFormRtl, this.dataFormRtlDetail);
}
