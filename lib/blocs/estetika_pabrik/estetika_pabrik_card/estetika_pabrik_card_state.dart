part of 'estetika_pabrik_card_cubit.dart';

@immutable
abstract class EstetikaPabrikCardState {}

class InitialEstetikaPabrikCardState extends EstetikaPabrikCardState {}

class IsEstetikaPabrikAswered extends EstetikaPabrikCardState {
  final bool isAnswered;
  final EstetikaPabrikFormModel? dataForm;
  // final bool isSend;

  IsEstetikaPabrikAswered(this.isAnswered, this.dataForm);
}

class NoConnectionEstetikaPabrikCardState extends EstetikaPabrikCardState {}
