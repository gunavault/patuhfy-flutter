part of 'lap_kerusakan_card_cubit.dart';

@immutable
abstract class LapKerusakanCardState {}

class InitialLapKerusakanCardState extends LapKerusakanCardState {}

class IsLapKerusakanAswered extends LapKerusakanCardState {
  final bool isAnswered;
  final LapKerusakanFormModel? dataForm;

  IsLapKerusakanAswered(this.isAnswered, this.dataForm);
}
