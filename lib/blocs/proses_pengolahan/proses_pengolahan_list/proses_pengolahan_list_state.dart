part of 'proses_pengolahan_list_cubit.dart';

@immutable
abstract class ProsesPengolahanListState {}

class LoadingProsesPengolahanListState extends ProsesPengolahanListState {}

class SuccessProsesPengolahanListState extends ProsesPengolahanListState {
  final List<ProsesPengolahanFormModel> data;
  SuccessProsesPengolahanListState(this.data);
}
