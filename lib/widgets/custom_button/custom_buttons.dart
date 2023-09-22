import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class PrimaryButton extends StatelessWidget {
  final String? buttonText;
  final Function? callBack;
  final Color? bgColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final bool? showLoader;

  const PrimaryButton(
      {super.key,
      this.buttonText,
      this.callBack,
      this.bgColor,
      this.fontSize,
      this.fontWeight,
      this.showLoader,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bgColor ?? CommonColors.bottomIconColor,
          borderRadius: BorderRadius.circular(12)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (callBack != null) callBack!();
          },
          child: Container(
            alignment: Alignment.center,
            child: showLoader ?? false
                ? const Center(
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          CommonColors.blackColor,
                        ),
                      ),
                    ),
                  )
                : Text(
                    buttonText!,
                    textAlign: TextAlign.center,
                    style: CommonStyle.getRalewayFont(
                        color: fontColor ?? CommonColors.whiteColor,
                        fontSize: fontSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.w500),
                  ),
          ),
        ),
      ),
    );
  }
}

class BackButtonCustom extends StatelessWidget {
  final Function? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;

  const BackButtonCustom(
      {super.key, this.onTap, this.padding, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else {
            Navigator.pop(context);
          }
        },
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.centerLeft,
          padding: padding ?? const EdgeInsets.all(0),
          child: Icon(
            Icons.arrow_back_ios,
            color: color ?? CommonColors.blackColor,
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Function? callBack;
  final Color? bgColor;
  final Color? iconColor;
  final String? image;
  final String? height;
  final String? width;

  const CustomIconButton({
    super.key,
    this.callBack,
    this.bgColor,
    this.iconColor,
    this.image,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: CommonColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            if (callBack != null) callBack!();
          },
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: Image.asset(
              image!,
              color: iconColor,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String? text;
  final Function? textOnTap;

  const AppTextButton({this.text, this.textOnTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (textOnTap != null) textOnTap!();
      },
      child: Text(
        text!,
        style: CommonStyle.getRalewayFont(
          color: CommonColors.textGeryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
