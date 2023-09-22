import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/pages/forms/apel_pagi/form_apel_pagi.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/button.dart';
import 'package:patuhfy/widgets/constant.dart';

class Tasksheet extends StatelessWidget {
  int? weekCount;
  DateTime selectedDate = DateTime.now();

  Tasksheet({super.key});

  int calculateWeekOfMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);

    int differenceInDays = date.difference(firstDayOfMonth).inDays;

    int weekOfMonth = (differenceInDays / 7).ceil();

    return weekOfMonth;
  }

  @override
  Widget build(BuildContext context) {
    int weekOfMonth = calculateWeekOfMonth(selectedDate);
    return Scaffold(
      backgroundColor: kDarkWhite,
      appBar: AppBar(
        backgroundColor: kDarkWhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Task Sheet SOP',
          style: kTextStyle.copyWith(
              color: kTitleColor, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.sort_rounded,
              color: kTitleColor,
            ),
          );
        }),
        actions: [
          TextButton(
            onPressed: () {
              // timesheetAddPopUp();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.notifications_on_sharp,
                    color: Color.fromARGB(255, 241, 94, 2)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                                  initialDate: DateTime.now(),
                                  locale: DatePicker.localeFromString('en'),
                                  onChange: (DateTime newDate, _) {
                                    setNewState(() {
                                      selectedDate = newDate;
                                    });
                                  },
                                  pickerTheme: const DateTimePickerTheme(
                                    itemTextStyle: TextStyle(
                                        color: Colors.black, fontSize: 19),
                                    dividerColor: Colors.transparent,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Cancel',
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: kBorderColorTextField),
                                    ),
                                    const SizedBox(width: 10.0),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Done',
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: kWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: CupertinoColors.systemGrey5,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: BlocBuilder<AuthSessionCubit, AuthUserSessionState>(
                  builder: (context, state) {
                    print('aaaaaaaaaaaaaaaaaaakuuuu');
                    if (state is AuthUserSessionUpdatedState) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 66.0,
                            width: 66.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      NetworkImage("${state.userModel!.foto}"),
                                  // AssetImage('assets/images/profile.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${state.userModel!.name}',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold,
                                    height: 0),
                              ),
                              Text(
                                '${state.userModel!.role}',
                                style: kTextStyle.copyWith(
                                    color: kGreyTextColor, height: 0),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${state.userModel!.psa_name}',
                                    style: kTextStyle.copyWith(
                                        color: kSubTitleColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: 220,
                                height: 5,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: 0.3,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Color(0xffFF4444)),
                                    backgroundColor: const Color(0xffFF4444)
                                        .withOpacity(0.1),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              RichText(
                                text: TextSpan(
                                  text: '4',
                                  style: kTextStyle.copyWith(
                                      color: kBlueColor, fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: ' /10 Task Selesai.',
                                      style: kTextStyle.copyWith(
                                          fontSize: 12, color: kTitleColor),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.cached_rounded,
                            color: kGreyTextColor,
                          )
                        ],
                      );
                    }

                    return Container(
                      child: Text('loading'),
                    );
                  },
                ),
              ),
            ),
            // const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Task List To Do',
                style: kTextStyle.copyWith(
                    color: kTitleColor, fontWeight: FontWeight.bold, height: 0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 06, bottom: 06),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FormApelPagi(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                CommonColors.containerTextB.withOpacity(0.2)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Checkbox(
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                activeColor: kRedColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                value: true,
                                onChanged: (val) {},
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Apel Pagi',
                                    textAlign: TextAlign.start,
                                    style: CommonStyle.getRalewayFont(
                                      color: CommonColors.blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Melakukan Apel Pagi',
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
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.attachment_outlined,
                                color: kTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 06, bottom: 06),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                CommonColors.containerTextB.withOpacity(0.2)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: Checkbox(
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                activeColor: kGreenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                value: true,
                                onChanged: (val) {},
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Inpeksi Hanca',
                                    textAlign: TextAlign.start,
                                    style: CommonStyle.getRalewayFont(
                                      color: CommonColors.blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Melakukan Inspeksi Hanca',
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
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.attachment_outlined,
                                color: kTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding:
            //       const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            //   child: Row(
            //     children: [
            //       Checkbox(
            //         visualDensity: const VisualDensity(horizontal: -4),
            //         activeColor: kGreenColor,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(6.0),
            //         ),
            //         value: false,
            //         onChanged: (val) {},
            //       ),
            //       const SizedBox(width: 5.0),
            //       Text(
            //         'Task List Kebun Harian',
            //         style: kTextStyle.copyWith(
            //           color: kTitleColor,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const Spacer(),
            //       IconButton(
            //         visualDensity: const VisualDensity(horizontal: -4),
            //         padding: EdgeInsets.zero,
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.more_vert_outlined,
            //           color: kGreyTextColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            //     child: Padding(
            //       padding: const EdgeInsets.only(bottom: 10.0),
            //       child: InkWell(
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(8.0),
            //             color: CommonColors.containerTextB.withOpacity(0.2),
            //           ),
            //           child: Column(
            //             children: [
            //               Theme(
            //                 data: Theme.of(context)
            //                     .copyWith(dividerColor: Colors.transparent),
            //                 child: ListTileTheme(
            //                   contentPadding: const EdgeInsets.all(0),
            //                   dense: true,
            //                   horizontalTitleGap: 0.0,
            //                   minLeadingWidth: 0,
            //                   child: ListTile(
            //                     iconColor: kSubTitleColor,
            //                     // collapsedIconColor: kSubTitleColor,
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(8.0),
            //                     ),

            //                     leading: Checkbox(
            //                       visualDensity:
            //                           const VisualDensity(horizontal: -4),
            //                       activeColor: kGreenColor,
            //                       shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(6.0),
            //                       ),
            //                       value: false,
            //                       onChanged: (val) {},
            //                     ),
            //                     title: Row(
            //                       mainAxisSize: MainAxisSize.max,
            //                       children: [
            //                         Text(
            //                           'Apel Pagi',
            //                           style: kTextStyle.copyWith(
            //                             color: kTitleColor,
            //                             fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     )),
            const SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: GlobalButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  // showSubmitPopUp();
                },
                child: const Text('Simpan ke Database Holding '),
              ),
            ),
          ],
        ),
      ),
      // drawer: const DrawerWidget(),
    );
  }
}
