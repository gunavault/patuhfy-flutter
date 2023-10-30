import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class DatepickerFormWidget extends StatefulWidget {
  const DatepickerFormWidget(
      {super.key,
      required this.fieldText,
      required this.fieldKeterangan,
      required this.fieldController});
  final String fieldText;
  final String fieldKeterangan;
  final TextEditingController fieldController;
  @override
  State<DatepickerFormWidget> createState() => _DatepickerFormWidgetState();
}

class _DatepickerFormWidgetState extends State<DatepickerFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldText,
            style: CommonStyle.getRalewayFont(
              color: CommonColors.blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              readOnly: true,
              onTap: () {
                _selectDateOrder(context);
              },
              controller: widget.fieldController,
              validator: (value) {
                if (value!.isEmpty) {
                  return widget.fieldKeterangan;
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 25,
                  minHeight: 25,
                ),
                suffixIcon: InkWell(
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.calendar_month,
                          size: 25, color: CommonColors.bottomIconColor),
                    ),
                    onTap: () {_selectDateOrder(context);}),
                contentPadding: const EdgeInsets.only(
                    left: 16, right: 18, top: 16, bottom: 16),
                labelText: widget.fieldText,
                fillColor: Colors.transparent,
                hintStyle: CommonStyle.getRalewayFont(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      color: CommonColors.redColor, width: 0.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                      color: CommonColors.redColor, width: 0.5),
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateOrder(BuildContext context) async {
    DateTime selectedDate = DateTime.now(), initialDate = DateTime.now();
    var firstDate =
        DateTime(initialDate.year, initialDate.month - 3, initialDate.day);
    var lastDate =
        DateTime(initialDate.year, initialDate.month, initialDate.day + 7);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            colorScheme:
                const ColorScheme.light(primary: Colors.blue, secondary: Colors.blue),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.fieldController.text =
            selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }
}
