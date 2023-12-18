part of 'cek_sampel_losis_list_cubit.dart';

@immutable
abstract class CekSampelLosisListState {}

class LoadingCekSampelLosisListState extends CekSampelLosisListState {}

class SuccessCekSampelLosisListState extends CekSampelLosisListState {
  final List<CekSampelLosisFormModel> data;
  SuccessCekSampelLosisListState(this.data);
}
