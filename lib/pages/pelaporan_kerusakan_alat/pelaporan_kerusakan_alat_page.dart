import 'package:flutter/material.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/constant.dart';

class PelaporanKerusakanAlatPage extends StatefulWidget {
  const PelaporanKerusakanAlatPage({super.key});

  @override
  State<PelaporanKerusakanAlatPage> createState() =>
      _PelaporanKerusakanAlatPageState();
}

class _PelaporanKerusakanAlatPageState
    extends State<PelaporanKerusakanAlatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkWhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pelaporan Kerusakan Alat',
          style: kTextStyle.copyWith(
              color: kTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Center(child: Text('YEY!')),
      ),
    );
  }
}
