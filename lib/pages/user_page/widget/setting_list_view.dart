import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class SettingListView extends StatelessWidget {
  final List<String>? image;
  final List<String>? text;
  final Function? onTap;
  final bool selectIcon;

  const SettingListView(
      {this.text, this.onTap, this.image, required this.selectIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: text?.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            const SizedBox(height: 26),
            InkWell(
              onTap: () {
                onTap!(index);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image![index],
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 30),
                  Text(
                    text![index],
                    style: CommonStyle.getRalewayFont(
                        color: CommonColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  selectIcon
                      ? const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: CommonColors.textGeryColor,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
