import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Disconnected extends StatelessWidget {
  const Disconnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animation/no_internet_lottie.json',
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'No Internet',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Coba cek sinyal hapemu yah.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
