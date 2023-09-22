import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class TimePickerView extends StatefulWidget {
  const TimePickerView({Key? key}) : super(key: key);

  @override
  State<TimePickerView> createState() => _TimePickerViewState();
}

class _TimePickerViewState extends State<TimePickerView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start Time",
                style: CommonStyle.getRalewayFont(
                  color: CommonColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: CommonColors.textGeryColor, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start Time",
                        style: CommonStyle.getRalewayFont(
                            color: CommonColors.textGeryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          _showTimePicker(context);
                        },
                        child: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "End Time",
                style: CommonStyle.getRalewayFont(
                  color: CommonColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: CommonColors.textGeryColor, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "End Time",
                        style: CommonStyle.getRalewayFont(
                            color: CommonColors.textGeryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          _showTimePicker(context);
                        },
                        child: const Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showTimePicker(ctx) {
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
                  mode: CupertinoDatePickerMode.time,
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
