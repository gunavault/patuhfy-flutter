import 'package:flutter/services.dart';
import 'package:patuhfy/utils/common_colors.dart';

class CommonMethods {
  CommonMethods._();

  static hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static Color colorBadge(status) {
    if (status == 'OPEN') {
      return CommonColors.bottomIconColor;
    } else if (status == 'REJECTED') {
      return CommonColors.redColor;
    } else {
      return CommonColors.containerTextB;
    }
  }
}
