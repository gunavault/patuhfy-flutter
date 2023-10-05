import 'package:flutter/cupertino.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class SwitchListView extends StatefulWidget {
  final List<String>? image;
  final List<String>? text;
  final Function? onTap;

  const SwitchListView({this.text, this.image, this.onTap, Key? key})
      : super(key: key);

  @override
  State<SwitchListView> createState() => _SwitchListViewState();
}

class _SwitchListViewState extends State<SwitchListView> {
  bool light0 = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.text?.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  widget.image![index],
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 30),
                Text(
                  widget.text![index],
                  textAlign: TextAlign.start,
                  style: CommonStyle.getRalewayFont(
                    color: CommonColors.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                CupertinoSwitch(
                  activeColor: CommonColors.bottomIconColor,
                  value: light0,
                  onChanged: (bool value) {
                    setState(() {
                      light0 = value;
                    });
                  },
                ),
                // Switch(
                //   value: light0,
                //   onChanged: (bool value) {
                //     setState(() {
                //       light0 = value;
                //     });
                //   },
                // )
              ],
            ),
            const SizedBox(height: 16)
          ],
        );
      },
    );
  }
}
