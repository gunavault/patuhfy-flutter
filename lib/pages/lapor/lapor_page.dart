import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';

class LaporPage extends StatelessWidget {
  const LaporPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.exit_to_app),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Logout',
                ),
              ],
            ),
            onTap: () {
              context.read<PageCubit>().logout();
            },
          ),
          Center(child: Text('awwww')),
        ],
      ),
    );
  }
}
