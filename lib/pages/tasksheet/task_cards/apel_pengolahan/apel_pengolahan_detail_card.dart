import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/models/apel_pengolahan_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class ApelPengolahanDetailCard extends StatelessWidget {
  const ApelPengolahanDetailCard({super.key, required this.dataForm});

  final ApelPengolahanFormModel? dataForm;

  Widget fieldjenisapel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Apel',
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
                return 'Jenis Apel Tidak Boleh kosong';
              }
              return null;
            },
            initialValue: dataForm!.jenisApel,
            enabled: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 18, top: 16, bottom: 16),
              labelText: 'jenis Apel',
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
                return 'keterangan Pengamatan Tidak Boleh kosong';
              }
              return null;
            },
            initialValue: dataForm!.keterangan,
            enabled: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 18, top: 16, bottom: 16),
              labelText: 'keterangan',
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

  Widget evidenceApelPengolahan(context) {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Evidence Estetika Pabrik",
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
                    'Isian Task Estetika Pabrik',
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
              fieldjenisapel(),
              evidenceApelPengolahan(context),
              fieldketerangan(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
