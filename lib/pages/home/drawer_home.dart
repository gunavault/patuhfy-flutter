
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/configs/routers.dart';
import 'package:patuhfy/configs/styles.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: double.infinity,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: primaryColor),
              child: BlocBuilder<AuthSessionCubit, AuthUserSessionState>(
                builder: (context, authUserState) {
                  print('ke fire jug anih foto');
                  if (authUserState is AuthUserSessionUpdatedState) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: ClipOval(
                              child: authUserState.userModel!.foto == ""
                                  ? Image.asset(
                                      "assets/images/default_image.jpg",
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.cover,
                                    )
                                  : const Text('wew'),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.asset(
                                "assets/images/default_image.jpg",
                                fit: BoxFit.cover,
                                height: 75,
                                width: 75,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Profile',
                    style: body1,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, MyRouters.profile_page);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ProfilePage()),
                // );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.info),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('Tentang Aplikasi', style: body1),
                ],
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AboutPage()),
                // );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.message),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Kontak Bantuan',
                    style: body1,
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.vpn_key_sharp),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Ganti Password',
                    style: body1,
                  ),
                ],
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const GantiPasswordPage(),
                //   ),
                // );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Setting',
                    style: body1,
                  ),
                ],
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SettingPage(),
                //   ),
                // );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(Icons.exit_to_app),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Logout',
                    style: body1,
                  ),
                ],
              ),
              onTap: () {
                // context.read<PageCubit>().logout();
              },
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, right: 32, left: 32, bottom: 10),
              child: Image.asset(
                "assets/images/logo2.png",
                width: 20,
                fit: BoxFit.scaleDown,
              ),
            ),
            Column(
              children: [
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     Icon(Icons.you),
                //     Icon(Icons.image),
                //     Icon(Icons.facebook, color: Colors.blue),
                //     Icon(Icons.image),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Versi 1.0",
                  style: body1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showDialogTentangAplikasi(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'NUSAKITA',
                style: body1.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Aplikasi retail PTPN Group',
                style: textAngka.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style: body1,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
