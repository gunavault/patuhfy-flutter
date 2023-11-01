part of 'apel_pagi_pengolahan_card_cubit.dart';

@immutable
abstract class ApelPagiPengolahanCardState {}

class InitialApelPagiPengolahanCardState extends ApelPagiPengolahanCardState {}

class IsApelPagiPengolahanAswered extends ApelPagiPengolahanCardState {
  final bool isAnswered;
  final ApelPagiPengolahanFormModel? dataForm;
  // final bool isSend;

  IsApelPagiPengolahanAswered(this.isAnswered, this.dataForm);
}
