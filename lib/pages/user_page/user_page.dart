import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/widgets/constant.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});
  Widget _createListMenu(String menuTitle) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 18, 0, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(menuTitle,
                style: const TextStyle(fontSize: 15, color: Color(0xFF515151))),
            const Icon(Icons.chevron_right, size: 20, color: SOFT_GREY),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          title: const Text(
            'User Profile',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: kDarkWhite,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: const [],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              )),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _createListMenu('About'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Terms and Conditions'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Privacy Policy'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.read<PageCubit>().logout();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.power_settings_new,
                          size: 20, color: ASSENT_COLOR),
                      SizedBox(width: 8),
                      Text('Sign Out',
                          style: TextStyle(fontSize: 15, color: ASSENT_COLOR)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
