part of 'cek_monitoring_ipal_card_cubit.dart';

@immutable
abstract class CekMonitoringIpalCardState {}

class InitialCekMonitoringIpalCardState extends CekMonitoringIpalCardState {}

class IsCekMonitoringIpalAswered extends CekMonitoringIpalCardState {
  final bool isAnswered;
  final CekMonitoringIpalFormModel? dataForm;
  // final bool isSend;

  IsCekMonitoringIpalAswered(this.isAnswered, this.dataForm);
}

class NoConnectionCekMonitoringIpalCardState extends CekMonitoringIpalCardState {}
