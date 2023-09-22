// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/pages/login/login_page.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    Key? key,
  }) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  double percent = 0.33;

  List<Map<String, dynamic>> sliderList = [
    {
      "title": 'Patuhi App',
      "description": 'Built by IT PTPN Group',
      "icon": 'assets/images/onboard1.png',
    },
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kWhite,
        ),
        backgroundColor: kWhite,
        body: PageView.builder(
          itemCount: sliderList.length,
          // physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (int index) =>
              setState(() => currentIndexPage = index),
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 290,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            sliderList[i]['icon'],
                          ),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    sliderList[i]['title'].toString(),
                    textAlign: TextAlign.center,
                    style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    sliderList[i]['description'].toString(),
                    style: kTextStyle.copyWith(
                      color: kSubTitleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 3.0,
                    percent: percent,
                    animation: true,
                    // progressColor: kPrimaryColor,
                    circularStrokeCap: CircularStrokeCap.round,
                    linearGradient: kPrimaryGradiant,
                    backgroundColor: kPrimaryColor.withOpacity(0.2),
                    center: GestureDetector(
                      onTap: () {
                        context.read<PageCubit>().setHasOnBoarding();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                          gradient: kPrimaryGradiant,
                        ),
                        child: const Icon(
                          FeatherIcons.chevronsRight,
                          color: kWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
