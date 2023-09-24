part of 'pencurian_tbs_card_cubit.dart';

@immutable
abstract class PencurianTbsCardState {}

class InitialPencurianTbsCardState extends PencurianTbsCardState {}

class IsPencurianTbsAswered extends PencurianTbsCardState {
  final bool isAnswered;
  final PencurianTbsFormModel? dataForm;

  IsPencurianTbsAswered(this.isAnswered, this.dataForm);
}
