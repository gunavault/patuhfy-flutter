part of 'sync_masterdata_cubit.dart';

@immutable
abstract class SyncMasterdataState {}

class InitialSyncMasterdataState extends SyncMasterdataState {}

class LoadingSyncMasterdataState extends SyncMasterdataState {}

class SuccessSyncMasterdataState extends SyncMasterdataState {
  final String message;
  SuccessSyncMasterdataState({required this.message});
}

class SuccessSyncMasterdataAfdelingState extends SyncMasterdataState {
  final String message;
  SuccessSyncMasterdataAfdelingState({required this.message});
}

class SuccessSyncMasterdataBlokState extends SyncMasterdataState {
  final String message;
  SuccessSyncMasterdataBlokState({required this.message});
}

class SuccessSyncMasterdataMandorState extends SyncMasterdataState {
  final String message;
  SuccessSyncMasterdataMandorState({required this.message});
}

class SuccessSyncMasterdataPemanenState extends SyncMasterdataState {
  final String message;
  SuccessSyncMasterdataPemanenState({required this.message});
}

class HasDataToSyncState extends SyncMasterdataState {
  final int totalData;
  HasDataToSyncState({required this.totalData});
}

class NoDataToSyncState extends SyncMasterdataState {
  final int totalData;
  NoDataToSyncState({required this.totalData});
}

class ErrorSyncMasterdataState extends SyncMasterdataState {
  final String? message;

  ErrorSyncMasterdataState(this.message);
}

class NoConnectionSyncMasterdataState extends SyncMasterdataState {
  final String? message;

  NoConnectionSyncMasterdataState(this.message);
}
