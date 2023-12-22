import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoAccessWidget extends StatelessWidget {
  const NoAccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 120,
        ),
        Lottie.asset(
          'assets/animation/no-acces.json',
          height: 200,
          width: 200,
        ),
        const Text(
          'Kamu Tidak Memiliki Akses Untuk Melaporkan kerusakan Alat \n Silahkan Hubungi Asiten Pengolahan / Teknik untuk melaporkan ya',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
