part of 'selectbox_sampel_losis_cubit.dart';

@immutable
abstract class SelectboxSampelLosisState {}

class InitialState extends SelectboxSampelLosisState {}

class LoadingState extends SelectboxSampelLosisState {}

class SuccessState extends SelectboxSampelLosisState {
  final List<SampelLosisModel> listSampelLosis;
  SuccessState(this.listSampelLosis);
}

class ErrorState extends SelectboxSampelLosisState {}
