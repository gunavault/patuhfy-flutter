part of 'selectbox_afdeling_cubit.dart';

@immutable
abstract class SelectboxAfdelingState {}

class InitialState extends SelectboxAfdelingState {}

class LoadingState extends SelectboxAfdelingState {}

class SuccessState extends SelectboxAfdelingState {
  final List<AfdelingModel> listAllAfd;
  SuccessState(this.listAllAfd);
}

class ErrorState extends SelectboxAfdelingState {}
