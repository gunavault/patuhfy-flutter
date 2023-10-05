part of 'real_pemupukan_card_cubit.dart';

@immutable
abstract class RealPemupukanCardState {}

class InitialRealPemupukanCardState extends RealPemupukanCardState {}

class IsRealPemupukanAswered extends RealPemupukanCardState {
  final bool isAnswered;
  final RealPemupukanFormModel? dataForm;

  IsRealPemupukanAswered(this.isAnswered, this.dataForm);
}
