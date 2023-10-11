part of 'rtl_detail_list_cubit.dart';

@immutable
abstract class RtlDetailListState {}

class LoadingRtlDetailListListState extends RtlDetailListState {}

class NoDataRtlDetailListListState extends RtlDetailListState {
  final RtlListModel dataFormRtl;
  final List<RtlDetailListModel> dataFormRtlDetail;
  final UserModel userModel;

  NoDataRtlDetailListListState(
      this.dataFormRtl, this.dataFormRtlDetail, this.userModel);
}

class SuccessRtlDetailListListState extends RtlDetailListState {
  final RtlListModel dataFormRtl;
  final List<RtlDetailListModel> dataFormRtlDetail;
  final UserModel userModel;

  SuccessRtlDetailListListState(
      this.dataFormRtl, this.dataFormRtlDetail, this.userModel);
}
