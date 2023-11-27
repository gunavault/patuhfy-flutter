part of 'apel_pengolahan_card_cubit.dart';

@immutable
abstract class ApelPengolahanCardState {}

class InitialApelPengolahanCardState extends ApelPengolahanCardState {}

class IsApelPengolahanAswered extends ApelPengolahanCardState {
  final bool isAnswered;
  final bool isCheckout;
  final ApelPengolahanFormModel? dataForm;

  IsApelPengolahanAswered(this.isAnswered, this.isCheckout, this.dataForm);
}

class NoConnectionApelPengolahanCardState extends ApelPengolahanCardState {}

class ErrorUpdateApelPengolahanCardState extends ApelPengolahanCardState {}
