part of 'check_update_app_cubit.dart';

@immutable
abstract class CheckUpdateAppState {}

class CheckUpdateAppInitial extends CheckUpdateAppState {}

class HasNewUpdate extends CheckUpdateAppState {}

class NoUpdate extends CheckUpdateAppState {}

class UpdatingApp extends CheckUpdateAppState {}

class UpdatingAppLoading extends CheckUpdateAppState {}

class UpdatingAppSuccess extends CheckUpdateAppState {}
