import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/check_update_app/check_update_app_cubit.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/rtl_detail_form.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:restart_app/restart_app.dart';

class HasUpdateAppPage extends StatelessWidget {
  const HasUpdateAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CheckUpdateAppCubit, CheckUpdateAppState>(
        listener: (context, state) {
          print('aweakowjdlaksj $state');
          if (state is UpdatingAppLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 20),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mengunduh pembaharuan..'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          }

          if (state is UpdatingAppSuccess) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(
                context, 'Aplikasi berhasil diperbaharui.', Restart.restartApp);
          }
          // TODO: implement listener
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration:
                        const BoxDecoration(color: CommonColors.containerTextB),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 120),
                    Image.asset('assets/images/mailIn.png', height: 240),
                  ],
                ),
              ],
            ),
            const Text('Yey, ada update aplikasi terbaru!',
                style: TextStyle(fontSize: 20)),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
              child: Text(
                'Silahkan melakukan update aplikasi!',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: MaterialButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                onPressed: () {
                  BlocProvider.of<CheckUpdateAppCubit>(context).updatingApp();
                },
                color: CommonColors.bottomIconColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                elevation: 10,
                animationDuration: const Duration(milliseconds: 300),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text('Update Aplikasi',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.zero,
            //   child: MaterialButton(
            //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            //     onPressed: Restart.restartApp,
            //     color: CommonColors.containerTextO,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(30))),
            //     elevation: 10,
            //     animationDuration: Duration(milliseconds: 300),
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 32),
            //       child: Text('Restart Aplikasi',
            //           style: TextStyle(color: Colors.white)),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 3.25); //Current point to bottom left
    var firstControlPoint = Offset(size.width / 4, size.height / 3);
    var firstEndPoint = Offset(size.width / 2, size.height / 3 - 60);
    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height / 4 - 65);
    var secondEndPoint = Offset(size.width, size.height / 3 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 2.5); //Current point to top right
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
