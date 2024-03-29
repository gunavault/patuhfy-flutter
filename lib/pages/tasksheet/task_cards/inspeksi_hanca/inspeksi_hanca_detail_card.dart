
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class InspeksiHancaDetailCard extends StatelessWidget {
  const InspeksiHancaDetailCard({super.key, required this.dataForm});

  final InspeksiHancaFormModel? dataForm;

  Widget textFieldWidget({fieldText, fieldValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldText,
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
            initialValue: fieldValue.toString(),
            enabled: false,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  left: 16, right: 18, top: 16, bottom: 16),
              labelText: fieldText,
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
                    'Isian Task Inspeksi Hanca Panen',
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
              textFieldWidget(
                fieldText: 'Afdeling',
                fieldValue: dataForm!.afd,
              ),
              textFieldWidget(
                fieldText: 'Blok',
                fieldValue: dataForm!.blok,
              ),
              textFieldWidget(
                fieldText: 'Tahun Tanam',
                fieldValue: dataForm!.tahunTanam,
              ),
              textFieldWidget(
                fieldText: 'Kavpled',
                fieldValue: dataForm!.kapveld,
              ),
              textFieldWidget(
                fieldText: 'Mandor',
                fieldValue: dataForm!.mandor,
              ),
              textFieldWidget(
                fieldText: 'Pemanen',
                fieldValue: dataForm!.pemanen,
              ),
              textFieldWidget(
                fieldText: 'Brondolan Tidak dikutip',
                fieldValue: dataForm!.brondolanTidakDikutip,
              ),
              textFieldWidget(
                fieldText: 'Buah Busuk',
                fieldValue: dataForm!.buahBusuk,
              ),
              textFieldWidget(
                fieldText: 'Buah Lewat matang tidak dipanen',
                fieldValue: dataForm!.buahLewatMarangTidakDipanen,
              ),
              textFieldWidget(
                fieldText: 'Buah Lewat Matang Tidak diangkut ke TPH',
                fieldValue: dataForm!.buahLewatMatangTidakDiangkutKeTph,
              ),
              textFieldWidget(
                fieldText: 'Pelepah tidak dipotong 3 dan tidak di susun',
                fieldValue: dataForm!.pelepahTidakDipotongTiga,
              ),
              textFieldWidget(
                fieldText: 'Pelepah tidak di turunkan',
                fieldValue: dataForm!.pelepahTidakDiturunkan,
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
