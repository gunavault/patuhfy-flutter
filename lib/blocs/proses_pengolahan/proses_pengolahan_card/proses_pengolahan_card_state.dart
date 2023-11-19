part of 'proses_pengolahan_card_cubit.dart';

@immutable
abstract class ProsesPengolahanCardState {}

class InitialProsesPengolahanCardState extends ProsesPengolahanCardState {}

class IsProsesPengolahanAswered extends ProsesPengolahanCardState {
  final bool isAnswered;
  final ProsesPengolahanFormModel? dataForm;
  // final bool isSend;

  IsProsesPengolahanAswered(this.isAnswered, this.dataForm);
}

class NoConnectionProsesPengolahanCardState extends ProsesPengolahanCardState {}
