part of 'real_penyiangan_card_cubit.dart';

@immutable
abstract class RealPenyianganCardState {}

class InitialRealPenyianganCardState extends RealPenyianganCardState {}

class IsRealPenyianganAswered extends RealPenyianganCardState {
  final bool isAnswered;
  final RealPenyianganFormModel? dataForm;

  IsRealPenyianganAswered(this.isAnswered, this.dataForm);
}
