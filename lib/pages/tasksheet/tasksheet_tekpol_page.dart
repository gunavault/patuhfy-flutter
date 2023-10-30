import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/tasksheet_page_bloc/tasksheet_page_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/apel_pagi/apel_pagi_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/inspeksi_hanca/inspeksi_hanca_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/inspeksi_tph/inspeksi_tph_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/lap_kerusakan/lap_kerusakan_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/pencurian_tbs/pencurian_tbs_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_pemeliharaan_jalan/real_pemeliharaan_jalan_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_pemupukan/real_pemupukan_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_pengendalian_hama/real_pengendalian_hama_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_penunasan/real_penunasan_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_penyiangan/real_penyiangan_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_pusingan_panen/real_pusingan_panen_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_restan/real_restan_card.dart';
import 'package:patuhfy/pages/tasksheet/widget/label_task_to_do.dart';
import 'package:patuhfy/pages/tasksheet/widget/pilih_tanggal_widget.dart';
import 'package:patuhfy/widgets/constant.dart';

import 'widget/filter_menu.dart';

class Tasksheet_Tekpol extends StatelessWidget {
  int? weekCount;
  DateTime dateNow = DateTime.now();
  bool isToday = false;
  Tasksheet_Tekpol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkWhite,
      appBar: AppBar(
        backgroundColor: kDarkWhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Teknik Pengolahan',
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
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.notifications_on_sharp, color: kGreyTextColor),
              ],
            ),
          ),
        ],
      ),
      body: Column(
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
                selectedDate: dateNow,
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
                  if (state is AuthUserSessionUpdatedState) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        state.userModel!.foto != null
                            ? Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${state.userModel!.foto}"),
                                      // AssetImage('assets/images/profile.png'),
                                      fit: BoxFit.cover),
                                ),
                              )
                            : Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
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

                  return const Text('loading');
                },
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          BlocBuilder<TasksheetPageCubit, TasksheetPageState>(
            builder: (context, state) {
              if (state is SetTasksheetPageState) {
                DateTime selectedDate = DateTime.parse(state.selectedDate);
                print('berapa ${dateNow.difference(selectedDate).inDays}');

                isToday = (dateNow.difference(selectedDate).inDays == 0
                    ? true
                    : false);

                return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelTaskDoTo(selectedDate: selectedDate),
                        Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.factory,size: 30,color: BLUE_PRIMARY,), 
                            Text(
                              "MENU TEKPOL",
                              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                     ],
                    ),
                  ),
                );
              }

              return const Disconnected();
            },
          ),

          const SizedBox(height: 20.0),
          // Padding(
          //   padding:
          //       const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          //   child: GlobalButton(
          //     width: MediaQuery.of(context).size.width,
          //     onPressed: () {
          //       // showSubmitPopUp();
          //     },
          //     child: const Text('Lihat History'),
          //   ),
          // ),
        ],
      ),
      // drawer: const DrawerWidget(),
    );
  }
}
