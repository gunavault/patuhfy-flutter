import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class LapKerusakanDetailCard extends StatelessWidget {
  const LapKerusakanDetailCard({super.key, required this.dataForm});

  final LapKerusakanFormModel? dataForm;

  Widget fieldAfdeling() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Afdeling',
          style: CommonStyle.getRalewayFont(
            color: CommonColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Afdeling Tidak Boleh kosong';
              }
              return null;
            },
            initialValue: dataForm!.afd,
            enabled: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 18, top: 16, bottom: 16),
              labelText: 'Kode Afdeling',
              fillColor: Colors.transparent,
              hintStyle: CommonStyle.getRalewayFont(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: CommonColors.textGeryColor, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: CommonColors.textGeryColor, width: 0.5),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget fieldketerangan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Keterangan',
          style: CommonStyle.getRalewayFont(
            color: CommonColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Keterangan Tidak Boleh kosong';
              }
              return null;
            },
            initialValue: dataForm!.keterangan,
            enabled: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 18, top: 16, bottom: 16),
              labelText: 'Keterangan',
              fillColor: Colors.transparent,
              hintStyle: CommonStyle.getRalewayFont(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: CommonColors.textGeryColor, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: CommonColors.textGeryColor, width: 0.5),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget fieldtindaklanjut() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tindakan Lanjutan',
          style: CommonStyle.getRalewayFont(
            color: CommonColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'tindak lanjut Tidak Boleh kosong';
              }
              return null;
            },
            initialValue: dataForm!.rencana_tindaklanjut,
            enabled: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 18, top: 16, bottom: 16),
              labelText: 'Tindakan Lanjutan',
              fillColor: Colors.transparent,
              hintStyle: CommonStyle.getRalewayFont(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: CommonColors.textGeryColor, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                    color: CommonColors.textGeryColor, width: 0.5),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget evidenceLapKerusakan(context) {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Evidence Laporan Kerusakan",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: CommonColors.blackColor,
          ),
        ),
        const SizedBox(height: 10.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.memory(
            base64Decode(dataForm!.foto.toString()),
            width: bannerWidth,
            height: bannerHeight,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Laporan Kerusakan',
                    style: kTextStyle.copyWith(
                        fontSize: 17,
                        color: kTitleColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FeatherIcons.x,
                      color: kSubTitleColor,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const SizedBox(height: 20.0),
              fieldAfdeling(),
              fieldketerangan(),
              fieldtindaklanjut(),
              evidenceLapKerusakan(context),
              const SizedBox(height: 30.0),
              // GlobalButton(
              //   width: MediaQuery.of(context).size.width,
              //   gradient: kPrimaryGradiant,
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Text(
              //     'Sync ke Database Holding',
              //     style: kTextStyle.copyWith(color: kWhite),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
