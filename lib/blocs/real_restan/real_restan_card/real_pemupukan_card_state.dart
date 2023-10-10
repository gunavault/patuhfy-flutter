part of 'real_pemupukan_card_cubit.dart';

@immutable
abstract class RealRestanCardState {}

class InitialRealRestanCardState extends RealRestanCardState {}

class IsRealRestanAswered extends RealRestanCardState {
  final bool isAnswered;
  final RealRestanFormModel? dataForm;

  IsRealRestanAswered(this.isAnswered, this.dataForm);
}
