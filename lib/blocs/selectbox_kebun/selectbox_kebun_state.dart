part of 'selectbox_kebun_cubit.dart';

@immutable
abstract class SelectboxKebunState {}

class InitialState extends SelectboxKebunState {}

class LoadingState extends SelectboxKebunState {}

class SuccessState extends SelectboxKebunState {
  final List<KebunModel> listKebun;
  SuccessState(this.listKebun);
}

class ErrorState extends SelectboxKebunState {}
