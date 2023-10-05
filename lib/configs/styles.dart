import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

//Color
const primaryColor = Color(0xFFFFC739);

const secondaryColor = Color(0xFFF2CF69);

// 0xFF017A35
const coklatKita = Color(0xFF623D22);
const linkColor = Color(0xFF3430FC);
// const cardColor1 = Color(0xFF006837);
const cardColor1 = Color(0xFF069138);

const cardGrayColor = Color(0xFFFFEFC1);
// AppBar

const appBarIconThemeColor = Colors.black;
const appBarMenuColor = Color(0xFF239445);
const SystemUiOverlayStyle appBarSystemOverlayStyle = SystemUiOverlayStyle.dark;

const TextStyle appBarTitle = TextStyle(fontSize: 18, color: Colors.black);
const TextStyle konfirmasiOrderInformationLabel =
    TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
const TextStyle konfirmasiOrderInformationText =
    TextStyle(fontWeight: FontWeight.normal, color: CHARCOAL, fontSize: 14);

var btnSalesOrder = GoogleFonts.raleway(
  fontWeight: FontWeight.bold,
  fontSize: 11,
);

const Color BLUE_PRIMARY = Color(0xFF2297f3);
const Color PRIMARY_COLORv2 = Color(0xFF07ac12);
const Color appBarBackgroundColor = Colors.white;
PreferredSizeWidget bottomAppBar() {
  return PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey[100],
        height: 1.0,
      ));
}

const Color BLACK77 = Color(0xFF777777);
const Color CHARCOAL = Color(0xFF515151);
const Color BLACK_GREY = Color(0xff777777);
const Color SOFT_GREY = Color(0xFFaaaaaa);
const Color SOFT_BLUE = Color(0xff01aed6);
const Color BLACK21 = Color(0xFF212121);
const Color BLACK55 = Color(0xFF555555);

// const Color SOFT_BLUE = Color(0xff01aed6);

// const cardProduct = Color();

// F2CF69
// #FFEFC1
// FFE391
// const cardGrayColor = Color(0xFFa7e5b2);

const searchSalesOrder = Color(0xFFF1EEEE);

//font
var heading1 = GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25);
var heading2 = GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 18);
var heading2LinkLight = GoogleFonts.raleway(fontSize: 18, color: linkColor);
var heading3 = GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 14);
var body1 = GoogleFonts.raleway(
  fontWeight: FontWeight.bold,
);

var fontProductNameKonfirmasiSO = const TextStyle(fontSize: 12, color: CHARCOAL);
var fontProductDescKonfirmasiSO = const TextStyle(fontSize: 12, color: CHARCOAL);

var fontProductNameSO = const TextStyle(
  fontSize: 12,
  color: CHARCOAL,
  fontWeight: FontWeight.bold,
);

var fontItemProduct = const TextStyle(fontSize: 12, color: CHARCOAL);
var fontItemProductDesc = const TextStyle(fontSize: 12, color: CHARCOAL);

var fontItemProductName = const TextStyle(
  fontSize: 15,
  color: CHARCOAL,
  fontWeight: FontWeight.bold,
);
var fontProductDescSO = const TextStyle(fontSize: 12, color: CHARCOAL);

var appBarText = GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 20);
var body1Black = GoogleFonts.raleway(color: Colors.black);
var linkText = GoogleFonts.raleway(color: linkColor);
var textSalesman = GoogleFonts.raleway(color: Colors.black);

//angka
var textAngka = GoogleFonts.roboto();
var heading2Angka =
    GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18);
var heading2AngkaLink = GoogleFonts.roboto(
    fontWeight: FontWeight.bold, fontSize: 18, color: linkColor);
var textAngkaLink = GoogleFonts.roboto(color: linkColor);
var textSalesmanAngka = GoogleFonts.roboto(color: Colors.black);

// var textSalesmanAngka = GoogleFonts.roboto(color: secondaryColor);
// class LineStyle {
//   const LineStyle({
//     this.color = Colors.grey,
//     this.thickness = 4,
//   });

//   /// The color used to paint the line. It defaults to ([Colors.grey]).
//   final Color color;

//   /// The thickness from the line. It can't be bigger than ([IndicatorStyle.width])
//   /// and defaults to 4.
//   final double thickness;
// }
