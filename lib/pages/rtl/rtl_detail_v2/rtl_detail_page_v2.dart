import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_update_status_form/rtl_update_status_form_cubit.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/rtl_detail_form.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/rtl_update_status_form.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/constant.dart';


import 'widget/rtLdetail_card_v2.dart';

class RtlDetailPageV2 extends StatelessWidget {
  const RtlDetailPageV2(
      {super.key, required this.dataRtl, required this.userModel});
  final RtlListModel dataRtl;
  final UserModel userModel;

  // void actionCloseRtlPopUp(context, int statusBtn, String rowstamp) {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return const Text('aw');
  //       return RtlUpdateStatusDialog(
  //         status: statusBtn,
  //         rowstamp: rowstamp,
  //       );
  //     },
  //   );
  // }

  void _getData(context) {
    BlocProvider.of<RtlDetailListCubit>(context).getData(dataRtl);
  }

  Widget statusWidget(RtlListModel data) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: const EdgeInsets.only(right: 40, left: 10, top: 10),
      decoration: BoxDecoration(
        color: CommonMethods.colorBadge(data.status),
        boxShadow: const [BoxShadow(color: Colors.transparent)],
        border: Border.all(color: const Color.fromARGB(255, 237, 236, 236)),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(
        data.status.toString(),
        style: const TextStyle(fontSize: 16, color: Color(0XFFFFFFFF)),
      ),
    );
  }

  void buttonSelesaikanRTL(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RtlUpdateStatusForm(
                  dataForm: dataRtl,
                )));
  }

  Widget _floatingActionButtonWidget(context, status) {
    if (userModel.role == 'MANAGER') {
      return Container();
    } else {
      if (status == 'OPEN') {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0, right: 10),
          child: FloatingActionButton(
            elevation: 1,
            child: const Icon(Icons.add), //child widget inside this button
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FormRtlDetailForm(
                    dataRtl: dataRtl,
                  ),
                ),
              );
              //task to execute when this button is pressed
            },
          ),
        );
      }
      return Container();
    }
  }

  Widget _floatingActionButton(context) {
    return BlocBuilder<RtlUpdateStatusFormCubit, RtlUpdateStatusFormState>(
      builder: (context, state) {
        if (state is LoadingRtlUpdateStatusFormState) {
          return _floatingActionButtonWidget(context, dataRtl.status);
        }
        if (state is SuccessRtlUpdateStatusFormState) {
          return _floatingActionButtonWidget(context, state.dataRtl.status);
        }

        return _floatingActionButtonWidget(context, dataRtl.status);
      },
    );
  }

  Widget __bottomNavigationWidget(context, status) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Expanded(
            child: ElevatedButton.icon(
              icon: status == 'OPEN'
                  ? const Icon(Icons.check)
                  : const Icon(Icons.block_flipped),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                backgroundColor: status == 'OPEN'
                    ? MaterialStateProperty.all<Color>(
                        CommonColors.titleTextColor)
                    : MaterialStateProperty.all<Color>(
                        CommonColors.textGeryColor),
              ),
              onPressed: () {
                status == 'OPEN' ? buttonSelesaikanRTL(context) : () {};
              },
              label: Text(
                status == 'OPEN' ? 'Selesaikan RTL ' : 'RTL Ditutup.',
                style: kTextStyle.copyWith(color: kWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigation(context) {
    if (userModel.role == 'MANAGER') {
      return BlocBuilder<RtlUpdateStatusFormCubit, RtlUpdateStatusFormState>(
        builder: (context, state) {
          if (state is LoadingRtlUpdateStatusFormState) {
            return __bottomNavigationWidget(context, dataRtl.status);
          }
          if (state is SuccessRtlUpdateStatusFormState) {
            return __bottomNavigationWidget(context, state.dataRtl.status);
          }

          return __bottomNavigationWidget(context, dataRtl.status);
        },
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(1.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('ddmmyyyy');
    String formattedDatetime = DateFormat('ddmmyyyy').format(DateTime.parse(dataRtl.mobileCreatedAt.toString()));


    _getData(context);
    return LoaderOverlay(
      overlayOpacity: 0.4,
      // overlayColor: Colors.black.withOpacity(0.4),
      child: Scaffold(
        floatingActionButton: _floatingActionButton(context),
        bottomNavigationBar: _bottomNavigation(context),
        backgroundColor: CommonColors.whiteColor,
        appBar: AppBarView(
          title: "List Detail RTL",
          firstIcon: Icons.arrow_back_ios_new_rounded,
          onBackPress: () {
            Navigator.pop(context);
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 26, right: 26, bottom: 0),
                    child: SizedBox(
                      height: 1,
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 26, right: 26, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Issue : ",
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dataRtl.deskripsi.toString(),
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<RtlUpdateStatusFormCubit,
                        RtlUpdateStatusFormState>(
                      builder: (context, state) {
                        if (state is InitialRtlUpdateStatusFormState) {
                          return statusWidget(dataRtl);
                        }
                        if (state is SuccessRtlUpdateStatusFormState) {
                          return statusWidget(state.dataRtl);
                        }
                        return statusWidget(dataRtl);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 26, right: 26, bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CommonColors.bottomIconColor.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: CommonColors.bottomIconColor,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        formattedDatetime,
                        style: CommonStyle.getRalewayFont(
                          color: CommonColors.blackColor1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 26, right: 26, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CommonColors.bottomIconColor.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.tag,
                          color: CommonColors.bottomIconColor,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        // margin:
                        //     const EdgeInsets.only(right: 40, left: 10, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CommonColors.bottomIconColor.withOpacity(0.2),
                        ),
                        child: Text(
                          dataRtl.kategori.toString(),
                          style: CommonStyle.getRalewayFont(
                            color: CommonColors.blackColor1,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RtlDetailCardV2(
                  dataRtl: dataRtl,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
