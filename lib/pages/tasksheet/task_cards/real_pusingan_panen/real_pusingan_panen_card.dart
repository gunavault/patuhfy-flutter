import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/real_pengendalian_hama/real_pengendalian_hama_card/real_pengendalian_hama_card_cubit.dart';
import 'package:patuhfy/blocs/real_pusingan_panen/real_pusingan_panen_card/real_pusingan_panen_card_cubit.dart';
import 'package:patuhfy/pages/forms/real_pengendalian_hama/form_real_pengendalian_hama.dart';
import 'package:patuhfy/pages/forms/real_pusingan_panen/form_real_pusingan_panen.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_pengendalian_hama/real_pengendalian_hama_detail_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/real_pusingan_panen/real_pusingan_panen_detail_card.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class RealPusinganPanenCard extends StatelessWidget {
  const RealPusinganPanenCard(
      {super.key, required this.selectedDate, required this.isToday});
  final String selectedDate;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealPusinganPanenCardCubit, RealPusinganPanenCardState>(
      builder: (context, state) {
        if (state is IsRealPusinganPanenAswered) {
          void timesheetAddPopUp(context) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                // return const Text('aw');
                return RealPusinganPanenDetailCard(
                  dataForm: state.dataForm,
                );
              },
            );
          }

          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 06, bottom: 06),
                  child: InkWell(
                    onTap: () {
                      if (!state.isAnswered) {
                        if (isToday) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FormRealPusinganPanen(
                                selectedDate: selectedDate,
                              ),
                            ),
                          );
                        } else {
                          FloatingSnackBar(
                            message: 'Oops, Pengisian Form sudah ditutup!',
                            context: context,
                            textColor: Colors.white,
                            textStyle: const TextStyle(color: Colors.white),
                            duration: const Duration(milliseconds: 1500),
                            backgroundColor: kOrangeColor,
                          );
                        }
                      } else {
                        timesheetAddPopUp(context);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: CommonColors.containerTextB.withOpacity(0.2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          !state.isAnswered
                              ? Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Checkbox(
                                    visualDensity:
                                        const VisualDensity(horizontal: -4),
                                    activeColor: kDarkWhite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    value: false,
                                    onChanged: (val) {},
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Checkbox(
                                    visualDensity:
                                        const VisualDensity(horizontal: -4),
                                    activeColor: state.dataForm!.isSend == 1
                                        ? kGreenColor
                                        : ratingBarColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    value: true,
                                    onChanged: (val) {},
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Realisasi Pusingan Panen',
                                  textAlign: TextAlign.start,
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Realisasi Pusingan Panen',
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.textGeryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     Icons.cloud_upload,
                          //     color: kNeutralColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const Disconnected();
      },
    );
  }
}
