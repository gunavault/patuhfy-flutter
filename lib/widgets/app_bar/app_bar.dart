import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Function? onBackPress;
  final Function? onNextPress;
  final IconData? firstIcon;
  final IconData? secondIcon;

  const AppBarView(
      {this.title,
      this.onBackPress,
      this.onNextPress,
      this.firstIcon,
      this.secondIcon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CommonColors.whiteColor,
      centerTitle: true,
      title: Text(
        title ?? "",
        style: CommonStyle.getRalewayFont(
            color: CommonColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
      elevation: 0,
      leading: onBackPress != null
          ? Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: onBackPress as void Function()?,
                highlightColor: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: CommonColors.containerTextB.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Center(
                    child: Icon(
                      firstIcon,
                      color: CommonColors.bottomIconColor,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
      leadingWidth: 68,
      actions: [
        onNextPress != null
            ? Padding(
                padding: const EdgeInsets.only(right: 26),
                child: InkWell(
                  onTap: onNextPress as void Function()?,
                  highlightColor: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 40,
                    width: 48,
                    decoration: BoxDecoration(
                        color: CommonColors.containerTextB.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: Icon(
                        secondIcon,
                        color: CommonColors.bottomIconColor,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
