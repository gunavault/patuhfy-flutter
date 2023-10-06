import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF017DC0);
const kSecondaryColor = Color(0xFF5580FF);
const kBlueColor = Color(0xFF00B5E8);
const kGreenColor = Color(0xFF51C185);
const kOrangeColor = Color(0xFFE47A05);
const kRedColor = Color.fromARGB(255, 248, 28, 4);
const kTitleColor = Color(0xFF08233D);
const kSubTitleColor = Color(0xFF405B74);
const kGreyColor = Color(0xFFC4C4C4);
const kNeutralColor = Color(0xFF484848);
const kLightNeutralColor = Color(0xFF7F7F7F);
const buttonColor = Color(0xffD9D9D9);
const kDarkWhite = Color(0xFFF6F6F6);
const kWhite = Color(0xFFFFFFFF);
const kBorderColorTextField = Color(0xFFDADEE2);
const kGreyTextColor = Color(0xFF8E98A0);
const ratingBarColor = Color(0xFFFFB33E);

LinearGradient kPrimaryGradiant = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF00B5E8),
    Color(0xFF017DC0),
  ],
);

LinearGradient kPrimaryGradiantNew = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 167, 225, 241),
    Color.fromARGB(255, 76, 205, 241),
  ],
);

LinearGradient kPrimaryGradiantGG = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 255, 255, 255),
  ],
);

final kTextStyle = GoogleFonts.poppins(
  color: kNeutralColor,
);

const kButtonDecoration = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.all(
    Radius.circular(8.0),
  ),
);

ButtonStyle elevatedButton = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
  ),
  shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF51C185)),
);

InputDecoration kInputDecoration = const InputDecoration(
    hintStyle: TextStyle(color: kSubTitleColor),
    filled: true,
    fillColor: Colors.white70,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kBorderColorTextField),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kBorderColorTextField),
    ));

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide.none,
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

bool isClient = false;
bool isFreelancer = false;
bool isFavorite = false;
const String currencySign = '€';
