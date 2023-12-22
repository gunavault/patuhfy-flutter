import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/pelaporan_kerusakan_alat/analisa_kerusakan_alat_list/analisa_kerusakan_alat_list_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/models/analisa_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/network/notfound.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/widget/pdf_reader_screen.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/widget/rtl_update_status_dialog.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/utils/pdf_reader.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class AnalisakerusakanAlatCardV2 extends StatelessWidget {
  const AnalisakerusakanAlatCardV2({super.key, required this.dataPelaporanKerusakanAlat});
  final PelaporanKerusakanAlatFormModel dataPelaporanKerusakanAlat;
  // PDFDocument? document;

  // void actionCloseRtlPopUp(context, int statusBtn, String rowstamp) {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext ctx) {
  //       // return const Text('aw');
  //       return RtlUpdateStatusDialog(
  //         status: statusBtn,
  //         rowstamp: rowstamp,
  //         dataRtl: dataPelaporanKerusakanAlat,
  //       );
  //     },
  //   );
  // }

  Widget widgetTombolApproval(
      context, String rowstamp, String status, String role) {
    if ( status == 'OPEN') {
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
                      // actionCloseRtlPopUp(context, 2, rowstamp);
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
                      // actionCloseRtlPopUp(context, 1, rowstamp);
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
                "List Analisa Kerusakan",
                style: CommonStyle.getRalewayFont(
                  color: CommonColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          BlocBuilder<AnalisakerusakanAlatListCubit, AnalisaKerusakanAlatListState>(
            builder: (context, state) {
              print('state apa nij $state');

              if (state is LoadingAnalisaKerusakanAlatListLState) {
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
              if (state is SuccessAnalisaKerusakanAlatListState) {
                List<AnalisaKerusakanAlatModel> dataAnalisakerusakanAlat =
                    state.dataFormAnalisaKerusakanAlat;
                print('dataAnalisakerusakanAlat $dataAnalisakerusakanAlat');

                return dataAnalisakerusakanAlat.isEmpty
                    ? const Center(child: NotFoundWidget())
                    : ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dataAnalisakerusakanAlat.length,
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
                                                      "${dataAnalisakerusakanAlat[index].jeniskerusakan}",
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
                                                      "Jenis Kerusakan : ${dataAnalisakerusakanAlat[index].jeniskerusakan}",
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
                                                      "Detail Kerusakan : ${dataAnalisakerusakanAlat[index].detailkerusakan}",
                                                      style: CommonStyle
                                                          .getRalewayFont(
                                                        color: CommonMethods
                                                            .colorBadge(
                                                                dataAnalisakerusakanAlat[
                                                                        index]
                                                                    .jeniskerusakan),
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
                                              // decoration: BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.circular(30),
                                              //   color:  dataAnalisakerusakanAlat[index].status == 'OPEN' ? Colors.blueAccent :        
                                              //           dataAnalisakerusakanAlat[index].status == 'DONE' ? Colors.green : Colors.red),
                                              child: const Icon(
                                                Icons.check,
                                                color: CommonColors.whiteColor,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // widgetTombolApproval(
                                        //     context,
                                        //     dataPelaporanKerusakanAlat.rowstamp.toString(),
                                        //     dataPelaporanKerusakanAlat.status.toString(),
                                        //     state.userModel.role.toString())
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
