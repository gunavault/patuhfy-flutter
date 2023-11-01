part of 'sync_to_server_cubit.dart';

@immutable
abstract class SyncToServerState {}

class InitialSyncToServerState extends SyncToServerState {}

class LoadingSyncToServerState extends SyncToServerState {}

class SuccessSyncToServerState extends SyncToServerState {
  final int status_code;
  final String message;
  SuccessSyncToServerState({required this.status_code, required this.message});
}

class HasDataToSyncState extends SyncToServerState {
  final int totalData;
  HasDataToSyncState({required this.totalData});
}

class NoDataToSyncState extends SyncToServerState {
  final int totalData;
  NoDataToSyncState({required this.totalData});
}

class ErrorSyncToServerState extends SyncToServerState {
  final String? message;

  ErrorSyncToServerState(this.message);
}

class NoConnectionSyncToServerState extends SyncToServerState {
  final String? message;

  NoConnectionSyncToServerState(this.message);
}
