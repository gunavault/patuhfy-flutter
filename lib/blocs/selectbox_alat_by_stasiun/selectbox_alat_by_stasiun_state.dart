part of 'selectbox_alat_by_stasiun_cubit.dart';

@immutable
abstract class SelectboxAlatByStasiunState {}

class InitialSbAlatByStasiunState extends SelectboxAlatByStasiunState {}

class LoadingSbAlatByStasiunState extends SelectboxAlatByStasiunState {}

class SuccessSbAlatByStasiunState extends SelectboxAlatByStasiunState {
  final List<AlatByStasiunModel> listAllAlatByStasiun;
  SuccessSbAlatByStasiunState(this.listAllAlatByStasiun);
}

class SetParamSBState extends SelectboxAlatByStasiunState {
  final String kodeMandor;
  SetParamSBState(this.kodeMandor);
}

class ErrorSbAlatByStasiunState extends SelectboxAlatByStasiunState {}
