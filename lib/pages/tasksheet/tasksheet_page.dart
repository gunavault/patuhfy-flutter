import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/tasksheet_page_bloc/tasksheet_page_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
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
import 'package:shimmer/shimmer.dart';
import 'widget/filter_menu.dart';

class Tasksheet extends StatelessWidget {
  int? weekCount;
  DateTime dateNow = DateTime.now();
  bool isToday = false;
  Tasksheet({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PerformaCubit>(context).getData();
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
                            BlocBuilder<PerformaCubit, PerformaState>(
                                builder: (context, state) {
                              if (state is SuccessPerformaListState) {
                                print(
                                    'bepraisi data ${state.dataForm.PERSEN_TASK}');
                                double? value = state.dataForm.PERSEN_TASK;

                                Color getColorForValue(double value) {
                                  if (value < 0.5) {
                                    return Colors.red;
                                  } else if (value >= 0.5 && value < 0.75) {
                                    return Colors.orange;
                                  } else {
                                    return Colors.green;
                                  }
                                }

                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Progress till ${DateTime.now().toString().split(' ')[0]}", // Display current date
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(
                                        height: 10), // Add vertical space here

                                    Center(
                                      child: SizedBox(
                                        width: 265,
                                        height: 5,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: LinearProgressIndicator(
                                            value: value,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    getColorForValue(value!)),
                                            backgroundColor:
                                                const Color(0xffFF4444)
                                                    .withOpacity(0.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${(state.dataForm.PERSEN_TASK! * 100).toStringAsFixed(2)}%",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                );
                              }

                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                enabled: true,
                                child: Container(
                                  width: 250,
                                  // width: double.infinity,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              );
                              // return CircularProgressIndicator();
                            }),
                            const SizedBox(height: 10.0),
                            BlocBuilder<PerformaCubit, PerformaState>(
                              builder: (context, state) {
                                if (state is SuccessPerformaListState) {
                                  return RichText(
                                    text: TextSpan(
                                      text: state.dataForm.JUMLAH_TASK,
                                      style: kTextStyle.copyWith(
                                          fontSize: 11, color: kBlueColor),
                                      children: [
                                        TextSpan(
                                          text:
                                              ' / ${state.dataForm.HARI_PRODUKTIF} Pekerjaan',
                                          style: kTextStyle.copyWith(
                                              fontSize: 11,
                                              color: kTitleColor,
                                              fontWeight: FontWeight.w500,
                                              height: 0),
                                        )
                                      ],
                                    ),
                                  );
                                }
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  enabled: true,
                                  child: Container(
                                    width: 100,
                                    // width: double.infinity,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                );
                              },
                            ),
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
          const FilterMenutaskSheet(),
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
                        ApelPagiCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        InspeksiHancaCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        InspeksiTphCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        PencurianTbsCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        LapKerusakanCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        RealPemupukanCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        RealPengendalianHamaCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        RealPusinganPanenCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        RealPemeliharaanJalanCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        RealPenyianganCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        RealPenunasanCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
                        ),
                        RealRestanCard(
                          selectedDate: state.selectedDate,
                          isToday: isToday,
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
