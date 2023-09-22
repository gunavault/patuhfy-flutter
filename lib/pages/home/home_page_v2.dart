import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:patuhfy/blocs/tabs/tab_cubit.dart';
import 'package:patuhfy/pages/approval_form/approval_form.dart';
import 'package:patuhfy/pages/close_rtl/close_rtl_page.dart';
import 'package:patuhfy/pages/home/drawer_home.dart';
import 'package:patuhfy/pages/lapor/lapor_page.dart';
import 'package:patuhfy/pages/tasksheet/tasksheet_page.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePageV2 extends StatelessWidget {
  HomePageV2({Key? key}) : super(key: key);

  final PageStorageBucket bucket = PageStorageBucket();

  // static const List<Widget> _widgetOptions = <Widget>[
  Widget _activeScreen(activeTab) {
    print('disin apa ${activeTab}');
    if (activeTab == TabState.home) {
      return Content(
        key: PageStorageKey('home'),
      );
    } else if (activeTab == TabState.tasksheet) {
      return Tasksheet(
        key: PageStorageKey('tasksheet'),
      );
    } else if (activeTab == TabState.approval) {
      return const ApprovalForm(
        key: PageStorageKey('approval'),
      );
    } else if (activeTab == TabState.lapor) {
      return const LaporPage(
        key: PageStorageKey('lapor'),
      );
    } else if (activeTab == TabState.closeRTL) {
      return const CloseRTL(
        key: PageStorageKey('close_rtl'),
      );
    }

    return Center(child: Text('error'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      builder: (context, activeTab) {
        print('acrtive apa nih $activeTab ');
        return Scaffold(
          body: PageStorage(
            bucket: bucket,
            child: Stack(
              children: [
                SafeArea(child: _activeScreen(activeTab)),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 2.0,
            selectedItemColor: kBlueColor,
            unselectedItemColor: kSubTitleColor,
            backgroundColor: kWhite,
            showUnselectedLabels: true,
            items: const [
              /// Home

              BottomNavigationBarItem(
                icon: Icon(IconlyLight.timeCircle),
                label: "Tasksheet",
              ),

              BottomNavigationBarItem(
                icon: Icon(IconlyLight.wallet),
                label: "Approval Form",
              ),

              BottomNavigationBarItem(
                icon: Icon(IconlyLight.calendar),
                label: "Lapor",
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyLight.profile),
                label: "Close RTL",
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: "Home",
              ),
            ],
            onTap: (int index) {
              print('aww ${activeTab}');
              context.read<TabCubit>().setTab(TabState.values[index]);
              print('ini print indexc kah ${index}');
              // setState(() => _currentPage = index);
            },
            currentIndex: activeTab.index,
          ),
          // drawer: const DrawerHome(),
        );
      },
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkWhite,
        appBar: AppBar(
          backgroundColor: kDarkWhite,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Home',
            style: kTextStyle.copyWith(
                color: kTitleColor, fontWeight: FontWeight.bold),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.sort_rounded,
                color: kTitleColor,
              ),
            );
          }),
          actions: [
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, color: kBlueColor),
                  Text(
                    'Add',
                    style: kTextStyle.copyWith(
                        color: kBlueColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: kTextStyle.copyWith(
                      color: kTitleColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 82,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: kPrimaryGradiant),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '25',
                            style: kTextStyle.copyWith(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          Text(
                            'Allowance',
                            style: kTextStyle.copyWith(
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12',
                            style: kTextStyle.copyWith(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          Text(
                            'Booked',
                            style: kTextStyle.copyWith(
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '06',
                            style: kTextStyle.copyWith(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          Text(
                            'Pending',
                            style: kTextStyle.copyWith(
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '30',
                            style: kTextStyle.copyWith(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          Text(
                            'Remaining',
                            style: kTextStyle.copyWith(
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: kWhite),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Curent Week Total',
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                          const SizedBox(height: 10.0),
                          RichText(
                            text: TextSpan(
                              text: '22.50',
                              style: kTextStyle.copyWith(
                                  color: kBlueColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: ' /40.00 Hrs',
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            '23 Sep 2021',
                            style: kTextStyle.copyWith(
                                color: kSubTitleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CircularPercentIndicator(
                        radius: 45.0,
                        lineWidth: 8.0,
                        percent: 0.60,
                        center: Text(
                          "22.50h",
                          style: kTextStyle.copyWith(color: kSubTitleColor),
                        ),
                        progressColor: kSecondaryColor,
                        backgroundColor: kSecondaryColor.withOpacity(0.2),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: kWhite),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '33.33%',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Utilisation',
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '7.50Hrs',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Chargeable',
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '15.50Hrs',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Non Chargeable',
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 5,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.3,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xffFF4444)),
                            backgroundColor:
                                const Color(0xffFF4444).withOpacity(0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: kWhite),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expense',
                        style: kTextStyle.copyWith(
                            color: kSubTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 5,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.8,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                kGreenColor),
                            backgroundColor: kGreenColor.withOpacity(0.1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$currencySign${65.45}',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Reimbursable',
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$currencySign${65.45}',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Reimbursable',
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF00E8EA),
                        Color(0xFF00B5E8),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Hours',
                        style: kTextStyle.copyWith(
                          color: kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Trending',
                        style: kTextStyle.copyWith(
                          color: kWhite,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        // drawer: const DrawerWidget(),
      ),
    );
  }
}
