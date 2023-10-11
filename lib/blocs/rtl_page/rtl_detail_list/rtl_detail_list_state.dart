part of 'rtl_detail_list_cubit.dart';

@immutable
abstract class RtlDetailListState {}

class LoadingRtlDetailListLState extends RtlDetailListState {}

class NoDataRtlDetailListState extends RtlDetailListState {
  final RtlListModel dataFormRtl;
  final List<RtlDetailListModel> dataFormRtlDetail;
  final UserModel userModel;

  NoDataRtlDetailListState(
      this.dataFormRtl, this.dataFormRtlDetail, this.userModel);
}

class SuccessRtlDetailListState extends RtlDetailListState {
  final RtlListModel dataFormRtl;
  final List<RtlDetailListModel> dataFormRtlDetail;
  final UserModel userModel;

  SuccessRtlDetailListState(
      this.dataFormRtl, this.dataFormRtlDetail, this.userModel);
}
