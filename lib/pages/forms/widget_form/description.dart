import 'package:flutter/material.dart';

import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class DescriptionView extends StatefulWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  TextEditingController edDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: CommonStyle.getRalewayFont(
            color: CommonColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          maxLines: 5,
          controller: edDescriptionController,
          cursorColor: CommonColors.blackColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: CommonColors.textGeryColor, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: CommonColors.textGeryColor, width: 0.5),
            ),
            hintText: "Description",
            hintStyle: CommonStyle.getRalewayFont(
                color: CommonColors.textGeryColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
        )
      ],
    );
  }
}
