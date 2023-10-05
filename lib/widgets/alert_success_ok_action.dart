import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:patuhfy/configs/styles.dart';

Future<void> showAlertSuccessOkAction(
    context, message, Function okAction) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Lottie.asset('assets/animation/success_check.json'),
              Text(
                message,
                style: body1.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'OK',
              style: body1,
            ),
            onPressed: () {
              okAction();
              // Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAlertSuccessOkActionV2(
    context, message, Function okAction) async {
  return _showPopup(context, message, okAction);
}

void _showPopup(BuildContext context, message, Function okAction) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: Colors.transparent,
            child: contentBox(context, message, okAction));
      });
}

contentBox(context, message, Function okAction) {
  return Stack(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
        margin: const EdgeInsets.only(top: 45),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Tekan tombol OK untuk kembali',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    okAction();
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Ok', style: TextStyle(fontSize: 18)),
                  )),
            ),
          ],
        ),
      ),
      Positioned(
        left: 20,
        right: 20,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 45,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(45)),
              child: Lottie.asset('assets/animation/success_check.json')),
        ),
      ),
    ],
  );
}
