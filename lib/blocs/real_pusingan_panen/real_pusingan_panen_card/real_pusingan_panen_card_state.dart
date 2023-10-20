part of 'real_pusingan_panen_card_cubit.dart';

@immutable
abstract class RealPusinganPanenCardState {}

class InitialRealPusinganPanenCardState extends RealPusinganPanenCardState {}

class IsRealPusinganPanenAswered extends RealPusinganPanenCardState {
  final bool isAnswered;
  final RealPusinganPanenFormModel? dataForm;

  IsRealPusinganPanenAswered(this.isAnswered, this.dataForm);
}
