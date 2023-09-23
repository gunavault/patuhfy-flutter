import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/tasksheet_page_bloc/tasksheet_page_cubit.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/apel_pagi/apel_pagi_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/inspeksi_hanca_card.dart';
import 'package:patuhfy/pages/tasksheet/widget/label_task_to_do.dart';
import 'package:patuhfy/pages/tasksheet/widget/pilih_tanggal_widget.dart';
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
            BlocBuilder<TasksheetPageCubit, TasksheetPageState>(
              builder: (context, state) {
                if (state is SetTasksheetPageState) {
                  return PilihTanggalTaskSheetWidget(
                    selectedDate: DateTime.parse(state.selectedDate),
                  );
                }

                return PilihTanggalTaskSheetWidget(
                  selectedDate: selectedDate,
                );
              },
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
                              // RichText(
                              //   text: TextSpan(
                              //     text: '4',
                              //     style: kTextStyle.copyWith(
                              //         color: kBlueColor, fontSize: 12),
                              //     children: [
                              //       TextSpan(
                              //         text: ' /10 Task Selesai.',
                              //         style: kTextStyle.copyWith(
                              //             fontSize: 12, color: kTitleColor),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.verified,
                            color: kBlueColor,
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

            BlocBuilder<TasksheetPageCubit, TasksheetPageState>(
              builder: (context, state) {
                if (state is SetTasksheetPageState) {
                  DateTime selectedDate = DateTime.parse(state.selectedDate);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelTaskDoTo(selectedDate: selectedDate),
                      ApelPagiCard(selectedDate: state.selectedDate),
                      InspeksiHancaCard(selectedDate: state.selectedDate)
                    ],
                  );
                }

                return Disconnected();
              },
            ),

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
