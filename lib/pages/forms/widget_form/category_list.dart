import 'package:flutter/material.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class CategoryList extends StatefulWidget {
  final String titleText;

  const CategoryList({required this.titleText, Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List onBorderingData = [
    {
      "taskText": "UI Design",
    },
    {
      "taskText": "App Development",
    },
    {
      "taskText": "Accounting",
    },
    {
      "taskText": "Dashboard Design",
    },
    {
      "taskText": "Web Development",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.titleText,
                style: CommonStyle.getRalewayFont(
                  color: CommonColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 46,
          width: double.infinity,
          child: ListView.builder(
            itemCount: onBorderingData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (buildContext, index) => InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                margin: const EdgeInsets.only(right: 06),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: index == 0
                      ? CommonColors.bottomIconColor
                      : CommonColors.bottomIconColor.withOpacity(0.2),
                ),
                child: Text(
                  onBorderingData[index]['taskText'] ?? "",
                  style: CommonStyle.getRalewayFont(
                      color: index == 0
                          ? CommonColors.whiteColor
                          : CommonColors.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
