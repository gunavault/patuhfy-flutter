part of 'real_pengendalian_hama_card_cubit.dart';

@immutable
abstract class RealPengendalianHamaCardState {}

class InitialRealPengendalianHamaCardState extends RealPengendalianHamaCardState {}

class IsRealPengendalianHamaAswered extends RealPengendalianHamaCardState {
  final bool isAnswered;
  final RealPengendalianHamaFormModel? dataForm;

  IsRealPengendalianHamaAswered(this.isAnswered, this.dataForm);
}
