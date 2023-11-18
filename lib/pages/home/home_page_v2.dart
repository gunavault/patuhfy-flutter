import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:patuhfy/blocs/tabs/tab_cubit.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/pages/pelaporan_kerusakan_alat/pelaporan_kerusakan_alat_page.dart';
import 'package:patuhfy/pages/rtl/rtl_page.dart';
import 'package:patuhfy/pages/tasksheet/tasksheet_page.dart';
import 'package:patuhfy/pages/user_page/user_page.dart';
import 'package:patuhfy/widgets/connectivity.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePageV2 extends StatelessWidget {
  final UserModel userModel;
  HomePageV2({Key? key, required this.userModel}) : super(key: key);

  final PageStorageBucket bucket = PageStorageBucket();

  // static const List<Widget> _widgetOptions = <Widget>[
  Widget _activeScreen(activeTab) {
    if (activeTab == TabState.profile) {
      return const UserProfilePage(
        key: PageStorageKey('profile'),
      );
    }

    if (activeTab == TabState.tasksheet) {
      return Tasksheet(
        key: const PageStorageKey('tasksheet'),
      );
    }

    if (userModel.psa_tipe == 'KEBUN') {
      if (activeTab == TabState.approval) {
        return const ConnectivityWidget(
          child: RtlPage(
            key: PageStorageKey('approval'),
          ),
        );
      }
    } else {
      if (activeTab == TabState.approval) {
        return const PelaporanKerusakanAlatPage(
          key: PageStorageKey('pelaporan_kerusakan_alat'),
        );
      }
    }

    //  else if (activeTab == TabState.closeRTL) {
    //   return const CloseRTL(
    //     key: PageStorageKey('close_rtl'),
    //   );
    // }

    return const Center(child: Text('error'));
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
            items: [
              /// Home

              const BottomNavigationBarItem(
                icon: Icon(IconlyLight.timeCircle),
                label: "Tasksheet",
              ),

              BottomNavigationBarItem(
                icon: const Icon(IconlyLight.document),
                label: userModel.psa_tipe == 'KEBUN'
                    ? "RTL"
                    : "Laporan Alat Rusak",
              ),

              // BottomNavigationBarItem(
              //   icon: Icon(IconlyLight.ticket),
              //   label: "Close RTL",
              // ),
              BottomNavigationBarItem(
                icon: Icon(IconlyLight.profile),
                label: "User",
              ),
            ],
            onTap: (int index) {
              print('aww $activeTab');
              context.read<TabCubit>().setTab(TabState.values[index]);
              print('ini print indexc kah $index');
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
