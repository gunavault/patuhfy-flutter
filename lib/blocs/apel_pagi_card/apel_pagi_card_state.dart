part of 'apel_pagi_card_cubit.dart';

@immutable
abstract class ApelPagiCardState {}

class InitialApelPagiCardState extends ApelPagiCardState {}

class IsApelPagiAswered extends ApelPagiCardState {
  final bool isAnswered;
  final ApelPagiFormModel? dataForm;

  IsApelPagiAswered(this.isAnswered, this.dataForm);
}
