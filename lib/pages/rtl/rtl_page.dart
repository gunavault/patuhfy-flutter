import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_list/rtl_list_cubit.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/network/notfound.dart';
import 'package:patuhfy/pages/rtl/rtl_detail_v2/rtl_detail_list_v2.dart';
import 'package:patuhfy/pages/rtl/widget/rtl_card_widget.dart';
import 'package:patuhfy/pages/rtl/widget/rtl_menu_widget.dart';
import 'package:patuhfy/widgets/constant.dart';

class RtlPage extends StatelessWidget {
  const RtlPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _onChangeMenu(menu) {
      print('menu awal $menu');
      BlocProvider.of<RtlListCubit>(context).getData(menu);
    }

    void _onClickFunction(RtlListModel data, UserModel userModel) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RtlDetailListV2(
                    dataForm: data,
                    userModel: userModel,
                  )));
    }

    return Scaffold(
      backgroundColor: kDarkWhite,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kPrimaryGradiant),
        ),
        // backgroundColor: kPrimaryGradiant,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Rencana Tindak Lanjut',
          style: kTextStyle.copyWith(
              color: kDarkWhite, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RtlMenuWidget(
                  onChangeMenu: _onChangeMenu,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<RtlListCubit, RtlListState>(
                  builder: (context, state) {
                    if (state is LoadingRtlListListState) {
                      return const CircularProgressIndicator();
                    }

                    if (state is NoConnectionRtlListListState) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    'assets/animation/no_internet_lottie.json',
                                    height: 250,
                                    width: 250,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'No Internet',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Coba cek sinyal hapemu yah.',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    if (state is ErrorRtlListListState) {
                      return const NotFoundWidget();
                    }

                    if (state is SuccessRtlListListState) {
                      if (state.dataForm.isEmpty) {
                        return const NotFoundWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.dataForm.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RtlCard(
                            data: state.dataForm[index],
                            onClickFunction: () {
                              _onClickFunction(
                                  state.dataForm[index], state.userModel);
                            },
                          );
                        },
                      );
                    }

                    return const Center(child: Text('Error'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Calendar { day, week, month, year }

// class RtlMenuWidget extends StatelessWidget {
//   RtlMenuWidget({super.key});
//   RtlMenuState menuRtl = RtlMenuState.OPEN;
// // RtlMenuCubit
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SegmentedButton<RtlMenuState>(
//         segments: const <ButtonSegment<RtlMenuState>>[
//           ButtonSegment<RtlMenuState>(
//               value: RtlMenuState.OPEN,
//               label: Text('Open'),
//               icon: Icon(Icons.folder_open)),
//           ButtonSegment<RtlMenuState>(
//               value: RtlMenuState.REJECT,
//               label: Text('Rejected'),
//               icon: Icon(Icons.close)),
//           ButtonSegment<RtlMenuState>(
//               value: RtlMenuState.DONE,
//               label: Text('Done'),
//               icon: Icon(Icons.checklist)),
//         ],
//         selected: <RtlMenuState>{menuRtl},
//         onSelectionChanged: (Set<RtlMenuState> newSelection) {
//           print('new selection ${newSelection.first}');
//           // setState(() {
//           //   // By default there is only a single segment that can be
//           //   // selected at one time, so its value is always the first
//           //   // item in the selected set.
//           //   print('newSelection ${newSelection.first}');
//           //   calendarView = newSelection.first;
//           // });
//         },
//       ),
//     );
//   }
// }




// enum Calendar { day, week, month, year }
