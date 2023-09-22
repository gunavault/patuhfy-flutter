import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class DatePickerView extends StatefulWidget {
  const DatePickerView({Key? key}) : super(key: key);

  @override
  State<DatePickerView> createState() => _DatePickerViewState();
}

class _DatePickerViewState extends State<DatePickerView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date & Time",
            style: CommonStyle.getRalewayFont(
              color: CommonColors.blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border:
                    Border.all(color: CommonColors.textGeryColor, width: 0.5)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: CommonStyle.getRalewayFont(
                        color: CommonColors.textGeryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      _showDatePicker(context);
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: CommonColors.bottomIconColor.withOpacity(0.2),
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: CommonColors.bottomIconColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDatePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: 200,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (val) {
                    setState(() {
                      //_chosenDateTime = val;
                    });
                  }),
            ),
            // CupertinoButton(
            //   child: const Text('OK'),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );
  }
}
