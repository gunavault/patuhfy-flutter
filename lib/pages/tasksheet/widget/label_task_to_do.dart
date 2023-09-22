import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patuhfy/widgets/constant.dart';

class LabelTaskDoTo extends StatelessWidget {
  const LabelTaskDoTo({super.key, required this.selectedDate});
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Task List To Do - ${DateFormat('dd MMMM yyyy').format(selectedDate)}',
        style: kTextStyle.copyWith(
            color: kTitleColor, fontWeight: FontWeight.bold, height: 0),
      ),
    );
  }
}
