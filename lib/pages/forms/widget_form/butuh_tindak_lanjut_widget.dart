import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class ButuhTindakLanjutWidgetForm extends StatefulWidget {
  const ButuhTindakLanjutWidgetForm(
      {super.key,
      required this.fieldText,
      required this.fieldKeterangan,
      required this.fieldType,
      required this.tindakLanjutController,
      required this.hasRtlController,
      this.isEnabled});

  final String fieldText;
  final String fieldKeterangan;
  final String fieldType;
  final TextEditingController tindakLanjutController;
  final TextEditingController hasRtlController;
  final bool? isEnabled;

  @override
  State<ButuhTindakLanjutWidgetForm> createState() =>
      _ButuhTindakLanjutWidgetFormState();
}

class _ButuhTindakLanjutWidgetFormState
    extends State<ButuhTindakLanjutWidgetForm> {
  bool isActive = false;
  @override
  void initState() {
    // TODO: implement initState
    widget.hasRtlController.text = 0.toString();
    super.initState();
  }

  void SetValueRtlController(value) {
    widget.hasRtlController.text = value ? 1.toString() : 0.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const SizedBox(width: 30),
            Text(
              'Butuh Rencana Tindak Lanjut..?',
              textAlign: TextAlign.start,
              style: CommonStyle.getRalewayFont(
                color: CommonColors.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            CupertinoSwitch(
              activeColor: CommonColors.bottomIconColor,
              value: isActive,
              onChanged: (bool value) {
                setState(() {
                  isActive = value;
                  SetValueRtlController(value);
                });
              },
            ),
            // Switch(
            //   value: light0,
            //   onChanged: (bool value) {
            //     setState(() {
            //       light0 = value;
            //     });
            //   },
            // )
          ],
        ),
        const SizedBox(height: 16),
        isActive
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.fieldText,
                    style: CommonStyle.getRalewayFont(
                      color: CommonColors.blackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      maxLines: 4,
                      enabled: widget.isEnabled == null ? true : false,
                      controller: widget.tindakLanjutController,
                      validator: (value) {
                        if (isActive) {
                          if (value!.isEmpty) {
                            return widget.fieldKeterangan;
                          }
                          return null;
                        } else {
                          return null;
                        }
                      },
                      keyboardType: (widget.fieldType == 'number')
                          ? TextInputType.number
                          : TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 18, top: 16, bottom: 16),
                        labelText: widget.fieldText,
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
                          borderSide: const BorderSide(
                              color: CommonColors.redColor, width: 0.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: CommonColors.redColor, width: 0.5),
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
              )
            : const SizedBox(
                height: 10,
              ),
      ],
    );
  }
}
