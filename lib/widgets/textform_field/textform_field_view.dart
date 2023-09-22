import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? titleName;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Function? callBackTextFormField;
  final Function? callBackOnChange;
  final Widget? suffixIcon;
  final Color? fillColor;
  final BoxConstraints? suffixConstraints;
  final bool? readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? isTitleName;

  const TextFormFieldCustom({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.textInputType,
    this.obscureText,
    this.suffixIcon,
    this.readOnly,
    this.callBackOnChange,
    this.callBackTextFormField,
    this.fillColor,
    this.maxLength,
    this.suffixConstraints,
    this.inputFormatters,
    this.enabled,
    this.titleName,
    this.isTitleName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitleName == true
            ? Text(
                titleName!,
                style: CommonStyle.getRalewayFont(
                  color: CommonColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          enabled: enabled ?? true,
          readOnly: readOnly ?? false,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: textInputType ?? TextInputType.text,
          cursorColor: CommonColors.blackColor,
          obscuringCharacter: "*",
          maxLength: maxLength,
          obscureText: obscureText ?? false,
          inputFormatters: inputFormatters ?? [],
          onChanged: (value) {
            if (callBackOnChange != null) callBackOnChange!(value);
          },
          style: CommonStyle.getRalewayFont(
              color: CommonColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 14),
          decoration: InputDecoration(
            counterText: "",
            contentPadding:
                const EdgeInsets.only(left: 16, right: 18, top: 16, bottom: 16),
            hintText: hintText ?? "HintText",
            filled: true,
            fillColor: fillColor ?? Colors.transparent,
            hintStyle: CommonStyle.getRalewayFont(
                color: CommonColors.textGeryColor,
                fontWeight: FontWeight.w400,
                fontSize: 15),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: CommonColors.textGeryColor, width: 0.5),
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
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixConstraints,
          ),
          onTap: () {
            if (callBackTextFormField != null) callBackTextFormField!();
          },
        ),
      ],
    );
  }
}
