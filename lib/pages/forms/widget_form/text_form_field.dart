import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class TextFormFieldWidgetForm extends StatelessWidget {
  const TextFormFieldWidgetForm(
      {super.key,
      required this.fieldText,
      required this.fieldKeterangan,
      required this.fieldType,
      required this.fieldController,
      this.isEnabled});

  final String fieldText;
  final String fieldKeterangan;
  final String fieldType;
  final TextEditingController fieldController;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldText,
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
            enabled: isEnabled == null ? true : false,
            controller: fieldController,
            validator: (value) {
              if (value!.isEmpty) {
                return fieldKeterangan;
              }
              return null;
            },
            keyboardType: (fieldType == 'number')
                ? TextInputType.number
                : TextInputType.text,
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
}
