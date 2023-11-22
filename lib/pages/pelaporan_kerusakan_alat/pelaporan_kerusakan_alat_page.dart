import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:patuhfy/blocs/pelaporan_kerusakan_alat/pelaporan_kerusakan_alat_list/pelaporan_kerusakan_alat_list_cubit.dart';
import 'package:patuhfy/pages/forms_pengolahan/pelaporan_kerusakan_alat/pelaporan_kerusakan_alat_form.dart';
import 'package:patuhfy/pages/network/notfound.dart';
import 'package:patuhfy/pages/pelaporan_kerusakan_alat/widget/pelaporan_kerusakan_alat_page_card.dart';
import 'package:patuhfy/pages/tasksheet/widget/filter_menu.dart';
import 'package:patuhfy/pages/tasksheet/widget/filter_menu_kerusakan_alat.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/constant.dart';

class PelaporanKerusakanAlatPage extends StatelessWidget {
  const PelaporanKerusakanAlatPage({super.key});

  void _getData(context) {
    BlocProvider.of<PelaporanKerusakanAlatListCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    _getData(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 10),
        child: FloatingActionButton(
          elevation: 1,
          child: const Icon(Icons.add), //child widget inside this button
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FormPelaporanKerusakanAlat(
                    // dataRtl: dataRtl,
                    ),
              ),
            );
            //task to execute when this button is pressed
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: kDarkWhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pelaporan Kerusakan Alat',
          style: kTextStyle.copyWith(
              color: kTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const FilterMenuKerusakanAlat(),
              BlocBuilder<PelaporanKerusakanAlatListCubit,
                  PelaporanKerusakanAlatListState>(
                builder: (context, state) {
                  if (state is LoadingPelaporanKerusakanAlatListState) {
                    return const CircularProgressIndicator();
                  }

                  if (state is NoConnectionPelaporanKerusakanAlatListState) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 26),
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
                        ),
                      ],
                    );
                  }

                  if (state is NoDataPelaporanKerusakanAlatListState) {
                    return const NotFoundWidget();
                  }

                  if (state is SuccessPelaporanKerusakanAlatListState) {
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
                        return PelaporanKerusakanAlatPageCard(
                          data: state.dataForm[index],
                          onClickFunction: () {
                            // _onClickFunction(
                            //     state.dataForm[index], state.userModel);
                          },
                        );
                      },
                    );
                  }

                  return const Center(child: Text('Error'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
