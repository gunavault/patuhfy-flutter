part of 'real_penyiangan_card_cubit.dart';

@immutable
abstract class RealPenunasanCardState {}

class InitialRealPenunasanCardState extends RealPenunasanCardState {}

class IsRealPenunasanAswered extends RealPenunasanCardState {
  final bool isAnswered;
  final RealPenunasanFormModel? dataForm;

  IsRealPenunasanAswered(this.isAnswered, this.dataForm);
}
