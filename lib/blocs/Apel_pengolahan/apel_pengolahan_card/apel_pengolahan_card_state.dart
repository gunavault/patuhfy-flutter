part of 'apel_pengolahan_card_cubit.dart';

@immutable
abstract class ApelPengolahanCardState {}

class InitialApelPengolahanCardState extends ApelPengolahanCardState {}

class IsApelPengolahanAswered extends ApelPengolahanCardState {
  final bool isAnswered;
  final ApelPengolahanFormModel? dataForm;
  // final bool isSend;

  IsApelPengolahanAswered(this.isAnswered, this.dataForm);
}

class NoConnectionApelPengolahanCardState extends ApelPengolahanCardState {}
