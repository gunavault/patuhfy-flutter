import 'package:flutter/material.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/utils/text_style.dart';

class RtlDetailCard extends StatelessWidget {
  const RtlDetailCard({super.key, required this.dataRtlDetail});
  final List<RtlDetailListModel> dataRtlDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
              // thickness: 1,
              ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "List Pekerjaan RTL",
                style: CommonStyle.getRalewayFont(
                  color: CommonColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataRtlDetail.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 06, bottom: 06),
                    child: InkWell(
                      onTap: () {
                        // widget.onTap!(index);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                CommonColors.containerTextB.withOpacity(0.2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20, left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          "${dataRtlDetail[index].deskripsiRealisasiRtl}",
                                          style: CommonStyle.getRalewayFont(
                                            color: CommonColors.blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          "Tanggal RTL : ${dataRtlDetail[index].tanggalRealisasiRtl}",
                                          style: CommonStyle.getRalewayFont(
                                            color: CommonColors.textGeryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          "Status : ${dataRtlDetail[index].status}",
                                          style: CommonStyle.getRalewayFont(
                                            color: CommonMethods.colorBadge(
                                                dataRtlDetail[index].status),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(12),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: index == 0
                                          ? CommonColors.bottomIconColor
                                              .withOpacity(0.2)
                                          : CommonColors.bottomIconColor
                                              .withOpacity(0.2)),
                                  child: const Icon(
                                    Icons.check,
                                    color: CommonColors.whiteColor,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 10, left: 20),
                                  child: MaterialButton(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 2),
                                    onPressed: () {},
                                    color: CommonColors.bottomIconColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    elevation: 0,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(' Evidence',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       top: 0, bottom: 10, left: 20),
                                //   child: Container(
                                //     padding:
                                //         const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                //     margin: EdgeInsets.only(
                                //         right: 10, left: 10, top: 10),
                                //     decoration: BoxDecoration(
                                //       color: CommonMethods.colorBadge(
                                //           dataRtlDetail[index].status),
                                //       boxShadow: const [
                                //         BoxShadow(color: Colors.transparent)
                                //       ],
                                //       border: Border.all(
                                //           color: CommonColors.containerTextB),
                                //       borderRadius: const BorderRadius.all(
                                //           Radius.circular(15)),
                                //     ),
                                //     child: Text(
                                //       dataRtlDetail[index].status.toString(),
                                //       style: const TextStyle(
                                //           fontSize: 16,
                                //           color: Color(0XFFFFFFFF)),
                                //     ),
                                //   ),
                                // ),
                              ],
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
    );
  }
}
