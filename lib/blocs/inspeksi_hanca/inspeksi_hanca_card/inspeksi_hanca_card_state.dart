part of 'inspeksi_hanca_card_cubit.dart';

@immutable
abstract class InspeksiHancaCardState {}

class InitialInspeksiHancaCardState extends InspeksiHancaCardState {}

class IsInspeksiHancaAswered extends InspeksiHancaCardState {
  final bool isAnswered;
  final InspeksiHancaFormModel? dataForm;

  IsInspeksiHancaAswered(this.isAnswered, this.dataForm);
}
