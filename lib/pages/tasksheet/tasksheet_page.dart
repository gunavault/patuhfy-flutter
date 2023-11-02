import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:patuhfy/blocs/apel_pagi/apel_pagi_card/apel_pagi_card_cubit.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_hanca/inspeksi_hanca_card/inspeksi_hanca_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_card/inspeksi_tph_card_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_card/pencurian_tbs_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemeliharaan_jalan/real_pemeliharaan_jalan_card/real_pemeliharaan_jalan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pengendalian_hama/real_pengendalian_hama_card/real_pengendalian_hama_card_cubit.dart';
import 'package:patuhfy/blocs/real_penunasan/real_penunasan_card/real_penyiangan_card_cubit.dart';
import 'package:patuhfy/blocs/real_penyiangan/real_penyiangan_card/real_penyiangan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pusingan_panen/real_pusingan_panen_card/real_pusingan_panen_card_cubit.dart';
import 'package:patuhfy/blocs/real_restan/real_restan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/sync_to_server/sync_to_server_cubit.dart';
import 'package:patuhfy/blocs/tasksheet_page_bloc/tasksheet_page_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/apel_pagi/apel_pagi_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/apel_pagi_pengolahan/apel_pagi_pengolahan_card.dart';
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
import 'package:patuhfy/pages/tasksheet/widget/card_loading.dart';
import 'package:patuhfy/pages/tasksheet/widget/label_task_to_do.dart';
import 'package:patuhfy/pages/tasksheet/widget/pilih_tanggal_widget.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:shimmer/shimmer.dart';
import 'widget/filter_menu.dart';

class Tasksheet extends StatelessWidget {
  int? weekCount;
  DateTime dateNow = DateTime.now();
  bool isToday = false;
  Tasksheet({super.key});

  List<Widget> taskList(
      UserModel userModel, bool isToday, state, selectedDate) {
    if (userModel.psa_tipe == 'KEBUN' && userModel.role == 'MANAGER') {
      return [
        LabelTaskDoTo(
          selectedDate: selectedDate,
        ),
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
      ];
    } else if (userModel.psa_tipe == 'KEBUN' && userModel.role != 'MANAGER') {
      return [
        LabelTaskDoTo(
          selectedDate: selectedDate,
        ),
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
        )
      ];
    } else if (userModel.psa_tipe == 'PABRIK') {
      return [
        LabelTaskDoTo(
          selectedDate: selectedDate,
        ),
        ApelPagiPengolahanCard(
          selectedDate: state.selectedDate,
          isToday: isToday,
        ),
      ];
    } else {
      return [
        Container(
          child: const Center(child: Text('No Card Found')),
        )
      ];
    }
  }

  ImageProvider<Object> getCharacterAvatar(String url) {
    final image = Image.network(
      url,
      errorBuilder: (BuildContext context, Object object, trace) {
        print('context $context');
        print('object $object');
        print('trace $trace');

        return Image(image: AssetImage('assets/icons/avatar2.png'));
      },
    ).image;
    return image;
  }

  void btnSync(context) {
    BlocProvider.of<SyncToServerCubit>(context).syncData();
  }

  void responseAfterSync(context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    showAlertSuccessOkActionV2(context, 'Sinkronisasi database berhasil.', () {
      print('update data');
      BlocProvider.of<ApelPagiCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));

      BlocProvider.of<InspeksiHancaCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));

      BlocProvider.of<InspeksiTphCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));

      BlocProvider.of<PencurianTbsCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));

      BlocProvider.of<RealPemupukanCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));
      BlocProvider.of<RealPenyianganCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));
      BlocProvider.of<RealPenunasanCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));
      BlocProvider.of<RealRestanCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));
      BlocProvider.of<RealPemeliharaanJalanCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));
      BlocProvider.of<RealPengendalianHamaCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));
      BlocProvider.of<RealPusinganPanenCardCubit>(context)
          .checkIsAnwered(dateNow.toString().substring(0, 10));

      BlocProvider.of<SyncToServerCubit>(context).getCountDataNotSend();
      // Navigator.pop(context);
    });
  }

  Widget _bottomNavigation(context, dateNow) {
    return BlocListener<SyncToServerCubit, SyncToServerState>(
      listener: (context, state) {
        if (state is SuccessSyncToServerState) {
          responseAfterSync(context);
        }
      },
      child: BlocBuilder<SyncToServerCubit, SyncToServerState>(
        builder: (context, state) {
          print('what is state $state');
          if (state is HasDataToSyncState) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.sync),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CommonColors.containerTextB),
                      ),
                      onPressed: () {
                        btnSync(context);
                      },
                      label: Text(
                        '${state.totalData} Task Belum dikirim ke server',
                        style: kTextStyle.copyWith(color: kWhite, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is LoadingSyncToServerState) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: ElevatedButton(
                      // icon: const Icon(Icons.sync),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CommonColors.containerTextO),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 15,
                              child: Lottie.asset(
                                  'assets/animation/loading.json')),
                          SizedBox(width: 10),
                          Text(
                            'Mengirim data ke server..',
                            style: kTextStyle.copyWith(
                                color: kWhite, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is NoDataToSyncState) {
            return const Padding(
              padding: EdgeInsets.all(1.0),
            );
          }

          return const Padding(
            padding: EdgeInsets.all(1.0),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PerformaCubit>(context).getData();
    return Scaffold(
      backgroundColor: kDarkWhite,
      bottomNavigationBar: _bottomNavigation(context, dateNow),
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
                        CachedNetworkImage(
                          imageUrl: "${state.userModel!.foto}",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black,
                              image: DecorationImage(
                                image: AssetImage('assets/icons/avatar2.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 50.0,
                        //   width: 50.0,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //         image: getCharacterAvatar(
                        //             "${state.userModel!.foto}"),
                        //         // Image.network("${state.userModel!.foto}"),
                        //         // AssetImage('assets/images/profile.png'),
                        //         fit: BoxFit.cover),
                        //   ),
                        // ),
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
                              print('Currstate $state');
                              if (state is SuccessPerformaListState) {
                                double? value = state.dataForm.PERSEN_TASK ?? 0;

                                Color getColorForValue(double value) {
                                  if (value < 0.5) {
                                    return Colors.red;
                                  } else if (value >= 0.5 && value < 0.75) {
                                    return Colors.orange;
                                  } else {
                                    return Colors.green;
                                  }
                                }

                                return Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   "Progress till ${DateTime.now().toString().split(' ')[0]}", // Display current date
                                        //   style: const TextStyle(fontSize: 13),
                                        // ),
                                        // const SizedBox(
                                        //     height: 10), // Add vertical space here

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, bottom: 04),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text:
                                                      "${state.dataForm.JUMLAH_TASK ?? '0'}",
                                                  style: kTextStyle.copyWith(
                                                      fontSize: 11,
                                                      color: kBlueColor),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          ' / ${state.dataForm.HARI_PRODUKTIF ?? '0'} Pekerjaan',
                                                      style:
                                                          kTextStyle.copyWith(
                                                              fontSize: 11,
                                                              color:
                                                                  kTitleColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 120),
                                              Text(
                                                "${(state.dataForm.PERSEN_TASK ?? 0 * 100).toStringAsFixed(2)}%",
                                                style:
                                                    CommonStyle.getRalewayFont(
                                                  color: CommonColors.textColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Center(
                                          child: SizedBox(
                                            width: 265,
                                            height: 10,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: LinearProgressIndicator(
                                                value: value,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color>(
                                                        getColorForValue(
                                                            value ?? 0)),
                                                backgroundColor:
                                                    const Color(0xffFF4444)
                                                        .withOpacity(0.1),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Text(
                                        //   "${(state.dataForm.PERSEN_TASK! * 100).toStringAsFixed(2)}%",
                                        //   style: const TextStyle(fontSize: 14),
                                        // ),
                                      ],
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

                  return CardDashboardLoading();
                },
              ),
            ),
          ),
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
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: taskList(
                              state.userModel, isToday, state, selectedDate)
                          // [
                          //

                          // ],
                          ),
                    ),
                  ),
                );
              }

              return const Disconnected();
            },
          ),

          // const SizedBox(height: 20.0),
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
