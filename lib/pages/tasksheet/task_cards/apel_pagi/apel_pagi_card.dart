import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:patuhfy/blocs/apel_pagi/apel_pagi_card/apel_pagi_card_cubit.dart';
import 'package:patuhfy/pages/forms/apel_pagi/form_apel_pagi.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/tasksheet/task_cards/apel_pagi/apel_pagi_detail_card.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/button.dart';
import 'package:patuhfy/widgets/constant.dart';

import '../../../../models/apel_pagi_form_model.dart';

class ApelPagiCard extends StatelessWidget {
  const ApelPagiCard({super.key, required this.selectedDate});
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApelPagiCardCubit, ApelPagiCardState>(
      builder: (context, state) {
        if (state is IsApelPagiAswered) {
          void timesheetAddPopUp(context) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return ApelPagiDetailCard(
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FormApelPagi(
                              selectedDate: selectedDate,
                            ),
                          ),
                        );
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
                                  'Apel Pagi',
                                  textAlign: TextAlign.start,
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Melakukan Apel Pagi',
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
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.attachment_outlined,
                              color: kTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Disconnected();
      },
    );
  }
}