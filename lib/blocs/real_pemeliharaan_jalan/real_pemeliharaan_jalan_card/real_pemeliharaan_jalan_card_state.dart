part of 'real_pemeliharaan_jalan_card_cubit.dart';

@immutable
abstract class RealPemeliharaanJalanCardState {}

class InitialRealPemeliharaanJalanCardState extends RealPemeliharaanJalanCardState {}

class IsRealPemeliharaanJalanAswered extends RealPemeliharaanJalanCardState {
  final bool isAnswered;
  final RealPemeliharaanJalanFormModel? dataForm;

  IsRealPemeliharaanJalanAswered(this.isAnswered, this.dataForm);
}
