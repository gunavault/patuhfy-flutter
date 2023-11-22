import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/cek_monitoring_ipal/cek_sampel_losis_card/cek_monitoring_ipal_card_cubit.dart';
import 'package:patuhfy/blocs/cek_rutin_sortasi/cek_rutin_sortasi_card/cek_rutin_sortasi_card_cubit.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_card/cek_sampel_losis_card_cubit.dart';
import 'package:patuhfy/pages/forms_pengolahan/cek_monitoring_ipal/form_monitoring_ipal_losis.dart';
import 'package:patuhfy/pages/forms_pengolahan/cek_rutin_sortasi/form_rutin_sortasi_losis.dart';
import 'package:patuhfy/pages/forms_pengolahan/cek_sampel_losis/form_cek_sampel_losis.dart';

import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/cek_monitoring_ipal/cek_monitoring_ipal_detail_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/cek_rutin_sortasi/cek_rutin_sortasi_detail_card.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/cek_sampel_losis/cek_sampel_losis_detail_card.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class CekRutinSortasiCard extends StatelessWidget {
  const CekRutinSortasiCard(
      {super.key, required this.selectedDate, required this.isToday});
  final String selectedDate;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CekRutinSortasiCardCubit, CekRutinSortasiCardState>(
      builder: (context, state) {
        print('asdasdsa $state');

        if (state is NoConnectionCekRutinSortasiCardState) {
          return Container(
            child: Text('No Internet'),
          );
        }
        if (state is IsCekRutinSortasiAswered) {
          if (state.dataForm != null) {}

          void timesheetAddPopUp(context) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return CekRutinSortasiDetailCard(
                  dataForm: state.dataForm,
                );
              },
            );
          }

          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                              builder: (context) => FormCekRutinSortasi(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                    activeColor: kGreenColor,
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
                                  'Rutin Sortasi ',
                                  textAlign: TextAlign.start,
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Melakukan Rutin Sortasi Monitoring Ipal',
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
