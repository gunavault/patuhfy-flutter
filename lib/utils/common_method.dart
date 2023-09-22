import 'package:flutter/services.dart';

class CommonMethods {
  CommonMethods._();

  static hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
