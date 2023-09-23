import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:patuhfy/blocs/apel_pagi_card/apel_pagi_card_cubit.dart';
import 'package:patuhfy/blocs/tasksheet_page_bloc/tasksheet_page_cubit.dart';
import 'package:patuhfy/widgets/constant.dart';

class PilihTanggalTaskSheetWidget extends StatelessWidget {
  PilihTanggalTaskSheetWidget({super.key, required this.selectedDate});

  DateTime selectedDate;

  int calculateWeekOfMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);

    int differenceInDays = date.difference(firstDayOfMonth).inDays;

    int weekOfMonth = (differenceInDays / 7).ceil();

    return weekOfMonth;
  }

  @override
  Widget build(BuildContext context) {
    int weekOfMonth = calculateWeekOfMonth(selectedDate);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, setNewState) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(DateFormat.yMMMd().format(selectedDate)),
                        DatePickerWidget(
                          looping: false,
                          // default is not looping
                          firstDate: DateTime(1990, 01, 01),
                          lastDate: DateTime(2030, 1, 1),
                          initialDate: selectedDate,
                          locale: DatePicker.localeFromString('en'),
                          onChange: (DateTime newDate, _) {
                            setNewState(() {
                              selectedDate = newDate;
                            });
                          },
                          pickerTheme: const DateTimePickerTheme(
                            itemTextStyle:
                                TextStyle(color: Colors.black, fontSize: 19),
                            dividerColor: Colors.transparent,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Batal',
                                style: kTextStyle.copyWith(
                                  color: const Color(0xFFFF5946),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              height: 30.0,
                              width: 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: kBorderColorTextField),
                            ),
                            const SizedBox(width: 10.0),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<TasksheetPageCubit>(context)
                                    .setDatePage(selectedDate
                                        .toString()
                                        .substring(0, 10));

                                BlocProvider.of<ApelPagiCardCubit>(context)
                                    .checkIsAnwered(selectedDate
                                        .toString()
                                        .substring(0, 10));
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Pilih',
                                style: kTextStyle.copyWith(
                                  color: kBlueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: kPrimaryGradiant),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhite.withOpacity(0.1),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowLeft2,
                      color: kWhite,
                      size: 18,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                DateFormat.yMMMd().format(selectedDate),
                style: kTextStyle.copyWith(
                    color: kWhite, fontWeight: FontWeight.bold),
              ),
              Text(
                ', $weekOfMonth week',
                style: kTextStyle.copyWith(
                    color: kWhite, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhite.withOpacity(0.1),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowRight2,
                      color: kWhite,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
