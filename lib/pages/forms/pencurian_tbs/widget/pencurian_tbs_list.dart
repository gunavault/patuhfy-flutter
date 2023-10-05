import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_list/pencurian_tbs_list_cubit.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/pencurian_tbs/pencurian_tbs_detail_card.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class PencurianTbsListView extends StatelessWidget {
  final String? titleText;
  final Function? onTap;

  const PencurianTbsListView({this.titleText, this.onTap, Key? key})
      : super(key: key);

  void timesheetAddPopUp(context, data) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PencurianTbsDetailCard(
          dataForm: data,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleText ?? "",
              style: CommonStyle.getRalewayFont(
                color: CommonColors.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        BlocBuilder<PencurianTbsListCubit, PencurianTbsListState>(
          builder: (context, state) {
            if (state is LoadingPencurianTbsListState) {
              return const CircularProgressIndicator();
            }

            if (state is SuccessPencurianTbsListState) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.dataForm.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 06, bottom: 06),
                        child: InkWell(
                          onTap: () {
                            timesheetAddPopUp(context, state.dataForm[index]);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: CommonColors.containerTextO
                                    .withOpacity(0.2)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(08),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: CommonColors.whiteColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: const Icon(
                                          Icons.warning,
                                          color: CommonColors.redColor,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pencurian TBS : ${state.dataForm[index].realisasiPencurianTbsKg.toString()} Kg (${state.dataForm[index].realisasiPencurianTbsTandan.toString()} Tandan)' ??
                                            "",
                                        textAlign: TextAlign.start,
                                        style: CommonStyle.getRalewayFont(
                                          color: CommonColors.blackColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      // Text(
                                      //   'Jumlah Tandan : ${state.dataForm[index].realisasiPencurianTbsTandan.toString()} Tandan' ??
                                      //       "",
                                      //   textAlign: TextAlign.start,
                                      //   style: CommonStyle.getRalewayFont(
                                      //     color: CommonColors.blackColor,
                                      //     fontSize: 13,
                                      //     fontWeight: FontWeight.w700,
                                      //   ),
                                      // ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${state.dataForm[index].rtl}',
                                        style: CommonStyle.getRalewayFont(
                                          color: CommonColors.textGeryColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_pin,
                                              color: Color(0xFFe75f3f),
                                              size: 15),
                                          const SizedBox(width: 2),
                                          Text(
                                              '${state.dataForm[index].afd} (${state.dataForm[index].blok})',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: CommonColors.textColor,
                                              )),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.calendar_month_outlined,
                                              color:
                                                  CommonColors.containerTextG,
                                              size: 15),
                                          const SizedBox(width: 2),
                                          Text(
                                              '${state.dataForm[index].mobileCreatedAt}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: CommonColors.textColor,
                                              )),
                                          const SizedBox(width: 8),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                // Padding(
                                //   padding: const EdgeInsets.all(12),
                                //   child: Text(
                                //     state.dataForm[index].tanggalDatetime
                                //         .toString(),
                                //     style: CommonStyle.getRalewayFont(
                                //       color: CommonColors.textGeryColor,
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                                //   ),
                                // ),
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
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
