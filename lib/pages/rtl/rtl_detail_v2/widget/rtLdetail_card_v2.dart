import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/network/notfound.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/widget/pdf_reader_screen.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/widget/rtl_detail_no_data.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/widget/rtl_update_status_dialog.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/utils/pdf_reader.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class RtlDetailCardV2 extends StatelessWidget {
  const RtlDetailCardV2({super.key, required this.dataRtl});
  final RtlListModel dataRtl;
  // PDFDocument? document;

  void actionCloseRtlPopUp(context, int statusBtn, String rowstamp) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) {
        // return const Text('aw');
        return RtlUpdateStatusDialog(
          status: statusBtn,
          rowstamp: rowstamp,
          dataRtl: dataRtl,
        );
      },
    );
  }

  Widget widgetTombolApproval(
      context, String rowstamp, String status, String role) {
    if (role == 'MANAGER' && status == 'OPEN') {
      return Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFFE9E4)),
                    ),
                    onPressed: () {
                      actionCloseRtlPopUp(context, 2, rowstamp);
                    },
                    label: Text(
                      'Tolak',
                      style: kTextStyle.copyWith(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF51C185)),
                    ),
                    onPressed: () {
                      actionCloseRtlPopUp(context, 1, rowstamp);
                    },
                    label: Text(
                      'Terima',
                      style: kTextStyle.copyWith(color: kWhite),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    // PDFDocument? document;

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
          BlocBuilder<RtlDetailListCubit, RtlDetailListState>(
            builder: (context, state) {
              print('state apa nij ${state}');

              if (state is LoadingRtlDetailListLState) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }
              if (state is SuccessRtlDetailListState) {
                List<RtlDetailListModel> dataRtlDetail =
                    state.dataFormRtlDetail;
                print('dataRtlDetail $dataRtlDetail');

                return dataRtlDetail.isEmpty
                    ? const Center(child: NotFoundWidget())
                    : ListView.builder(
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
                                padding:
                                    const EdgeInsets.only(top: 06, bottom: 06),
                                child: InkWell(
                                  onTap: () {
                                    // widget.onTap!(index);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: CommonColors.containerTextB
                                            .withOpacity(0.2)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    bottom: 20,
                                                    left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "${dataRtlDetail[index].deskripsiRealisasiRtl}",
                                                      style: CommonStyle
                                                          .getRalewayFont(
                                                        color: CommonColors
                                                            .blackColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Tanggal RTL : ${dataRtlDetail[index].tanggalRealisasiRtl}",
                                                      style: CommonStyle
                                                          .getRalewayFont(
                                                        color: CommonColors
                                                            .textGeryColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      "Status : ${dataRtlDetail[index].status}",
                                                      style: CommonStyle
                                                          .getRalewayFont(
                                                        color: CommonMethods
                                                            .colorBadge(
                                                                dataRtlDetail[
                                                                        index]
                                                                    .status),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: index == 0
                                                      ? CommonColors
                                                          .bottomIconColor
                                                          .withOpacity(0.2)
                                                      : CommonColors
                                                          .bottomIconColor
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
                                                  top: 0, bottom: 5, left: 20),
                                              child: MaterialButton(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 2),
                                                onPressed: () async {
                                                  String inMy =
                                                      await PdfReader.getPath(
                                                          dataRtlDetail[index]
                                                              .evidence
                                                              .toString(),
                                                          dataRtlDetail[index]
                                                              .rowstamp);

                                                  // ignore: use_build_context_synchronously
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PDFScreen(
                                                        path: inMy,
                                                      ),
                                                    ),
                                                  );

                                                  // pdfReader(doc);
                                                  // print('docc $doc');
                                                },
                                                color: CommonColors
                                                    .bottomIconColor,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30))),
                                                elevation: 0,
                                                animationDuration:
                                                    const Duration(
                                                        milliseconds: 300),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: Text('Buka Evidence',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        widgetTombolApproval(
                                            context,
                                            dataRtlDetail[index]
                                                .rowstamp
                                                .toString(),
                                            dataRtlDetail[index]
                                                .status
                                                .toString(),
                                            state.userModel.role.toString())
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
              }

              return Container(
                child: const Text('Oops, Cek Internet Anda'),
              );
            },
          ),
        ],
      ),
    );
  }
}
