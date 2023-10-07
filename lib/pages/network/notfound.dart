import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 120,
        ),
        Lottie.asset(
          'assets/animation/no_data.json',
          height: 200,
          width: 200,
        ),
        const Text(
          'Oops, Tidak ada data ditemukan!',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
