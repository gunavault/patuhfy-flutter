import 'package:flutter/material.dart';
import 'package:patuhfy/pages/forms/apel_pagi/form_apel_pagi.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/constant.dart';

class InspeksiHancaCard extends StatelessWidget {
  const InspeksiHancaCard({super.key, required this.selectedDate});
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 06, bottom: 06),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: CommonColors.containerTextB.withOpacity(0.2)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Checkbox(
                        visualDensity: const VisualDensity(horizontal: -4),
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
                            'Inpeksi Hanca',
                            textAlign: TextAlign.start,
                            style: CommonStyle.getRalewayFont(
                              color: CommonColors.blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Melakukan Inspeksi Hanca',
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
}
