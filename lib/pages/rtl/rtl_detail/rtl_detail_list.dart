import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';

class RtlDetailList extends StatelessWidget {
  const RtlDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    Image.asset('assets/images/allTaskDone2.png', height: 240),
                  ],
                ),
              ],
            ),
            const Text('Belum ada Update Pekerjaan!',
                style: TextStyle(fontSize: 20)),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
              child: Text(
                'Silahkan menambahkan Detail Pekerjaan untuk menyelesaikan Tindak Lanjut!',
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
                onPressed: () {},
                color: CommonColors.bottomIconColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                elevation: 10,
                animationDuration: const Duration(milliseconds: 300),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text('Tambah Data',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
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
