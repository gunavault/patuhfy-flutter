import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/connectivity/connectivity_cubit.dart';
import 'package:patuhfy/pages/network/disconnected.dart';

class ConnectivityWidget extends StatelessWidget {
  final Widget child;
  const ConnectivityWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityInitial) {
          return child;
        } else if (state is HasConnection) {
          if (state.connection) {
            return child;
          } else {
            return Disconnected();
          }
        }

        return Disconnected();
      },
    );
  }
}
