import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class RtlPage extends StatelessWidget {
  const RtlPage({super.key});
  @override
  Widget build(BuildContext context) {
    List aaa = [
      Center(
          child: Text(
        'awww',
        style: TextStyle(color: Colors.black),
      )),
      Center(child: Text('yess')),
      Center(child: Text('ayes'))
    ];
    return Scaffold(
      backgroundColor: kDarkWhite,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kPrimaryGradiant),
        ),
        // backgroundColor: kPrimaryGradiant,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Rencana Tindak Lanjut',
          style: kTextStyle.copyWith(
              color: kDarkWhite, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChoice(),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 06, bottom: 06),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: CommonColors.containerTextB
                                      .withOpacity(0.2)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 12, bottom: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Yogie" ?? "",
                                          textAlign: TextAlign.start,
                                          style: CommonStyle.getRalewayFont(
                                            color: CommonColors.blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          "gass" ?? "",
                                          style: CommonStyle.getRalewayFont(
                                            color: CommonColors.textGeryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      'wewew' ?? "",
                                      style: CommonStyle.getRalewayFont(
                                        color: CommonColors.textGeryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton<Calendar>(
        segments: const <ButtonSegment<Calendar>>[
          ButtonSegment<Calendar>(
              value: Calendar.day,
              label: Text('Open'),
              icon: Icon(Icons.folder_open)),
          ButtonSegment<Calendar>(
              value: Calendar.week,
              label: Text('Rejected'),
              icon: Icon(Icons.close)),
          ButtonSegment<Calendar>(
              value: Calendar.month,
              label: Text('Done'),
              icon: Icon(Icons.checklist)),
        ],
        selected: <Calendar>{calendarView},
        onSelectionChanged: (Set<Calendar> newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            print('newSelection ${newSelection.first}');
            calendarView = newSelection.first;
          });
        },
      ),
    );
  }
}
