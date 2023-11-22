part of 'cek_sampel_losis_card_cubit.dart';

@immutable
abstract class CekSampelLosisCardState {}

class InitialCekSampelLosisCardState extends CekSampelLosisCardState {}

class IsCekSampelLosisAswered extends CekSampelLosisCardState {
  final bool isAnswered;
  final CekSampelLosisFormModel? dataForm;
  // final bool isSend;

  IsCekSampelLosisAswered(this.isAnswered, this.dataForm);
}

class NoConnectionCekSampelLosisCardState extends CekSampelLosisCardState {}
