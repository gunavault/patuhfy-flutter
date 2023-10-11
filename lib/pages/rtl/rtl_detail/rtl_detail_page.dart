import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/rtl_detail_form.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/widget/rtLdetail_card.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/constant.dart';

import 'rtl_detail_update_status_form.dart';
import 'widget/rtl_update_status_dialog.dart';

class RtlDetailPage extends StatelessWidget {
  const RtlDetailPage(
      {super.key,
      required this.dataRtl,
      required this.dataRtlDetail,
      required this.userModel});
  final RtlListModel dataRtl;
  final List<RtlDetailListModel> dataRtlDetail;
  final UserModel userModel;

  void buttonSelesaikanRTL(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RtlDetailUpdateStatusForm()));
  }

  Widget _floatingActionButton(context) {
    if (userModel.role == 'MANAGER') {
      return Container();
    } else {
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
  }

  Widget _bottomNavigation(context) {
    if (userModel.role == 'MANAGER') {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const SizedBox(width: 10.0),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check),
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
                      CommonColors.titleTextColor),
                ),
                onPressed: () {
                  buttonSelesaikanRTL(context);
                },
                label: Text(
                  'Selesaikan RTL ',
                  style: kTextStyle.copyWith(color: kWhite),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(10.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin:
                          const EdgeInsets.only(right: 40, left: 10, top: 10),
                      decoration: BoxDecoration(
                        color: CommonMethods.colorBadge(dataRtl.status),
                        boxShadow: const [BoxShadow(color: Colors.transparent)],
                        border: Border.all(
                            color: const Color.fromARGB(255, 237, 236, 236)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Text(
                        dataRtl.status.toString(),
                        style: const TextStyle(
                            fontSize: 16, color: Color(0XFFFFFFFF)),
                      ),
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
                        dataRtl.mobileCreatedAt.toString(),
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
                RtlDetailCard(
                  dataRtlDetail: dataRtlDetail,
                  role: userModel.role.toString(),
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
