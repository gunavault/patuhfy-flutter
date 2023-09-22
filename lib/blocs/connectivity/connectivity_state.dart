part of 'connectivity_cubit.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class HasConnection extends ConnectivityState {
  final bool connection;

  HasConnection(this.connection);
}
