part of 'inspeksi_tph_card_cubit.dart';

@immutable
abstract class InspeksiTphCardState {}

class InitialInspeksiTphCardState extends InspeksiTphCardState {}

class IsInspeksiTphAswered extends InspeksiTphCardState {
  final bool isAnswered;
  final InspeksiTphFormModel? dataForm;

  IsInspeksiTphAswered(this.isAnswered, this.dataForm);
}
