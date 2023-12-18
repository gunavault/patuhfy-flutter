import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_list/cek_sampel_losis_list_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_list/estetika_pabrik_list_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_list/pencurian_tbs_list_cubit.dart';
import 'package:patuhfy/blocs/proses_pengolahan/proses_pengolahan_list/proses_pengolahan_list_cubit.dart';
import 'package:patuhfy/pages/forms/cek_estetika_pabrik/widget/estetika_pabrik_list.dart';
import 'package:patuhfy/pages/forms/cek_sampel_losis/widget/cek_sampel_losis_list.dart';
import 'package:patuhfy/pages/forms/pencurian_tbs/form_pencurian_tbs.dart';
import 'package:patuhfy/pages/forms/pencurian_tbs/widget/pencurian_tbs_list.dart';
import 'package:patuhfy/pages/forms/proses_pengolahan/widget/proses_pengolahan_list.dart';
import 'package:patuhfy/pages/forms_pengolahan/cek_sampel_losis/form_cek_sampel_losis.dart';
import 'package:patuhfy/pages/forms_pengolahan/estetika_pabrik/form_estetika_pabrik.dart';
import 'package:patuhfy/pages/forms_pengolahan/proses_pengolahan/form_proses_pengolahan.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';

class ListProsesPengolahan extends StatelessWidget {
  const ListProsesPengolahan({super.key, required this.selectedDate});

  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProsesPengolahanListCubit>(context).getData(selectedDate);
    return LoaderOverlay(
      overlayOpacity: 0.4,
      overlayColor: Colors.black.withOpacity(0.4),
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30.0, right: 10),
          child: FloatingActionButton(
            elevation: 1,
            child: const Icon(Icons.add), //child widget inside this button
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FormProsesPengolahan(
                    selectedDate: selectedDate,
                  ),
                ),
              );
              //task to execute when this button is pressed
            },
          ),
        ),
        backgroundColor: CommonColors.whiteColor,
        appBar: AppBarView(
          title: "List Proses Pengolahan",
          firstIcon: Icons.arrow_back_ios_new_rounded,
          onBackPress: () {
            Navigator.pop(context);
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
              child: Column(
                children: [
                  ProsesPengolahanListView(
                    titleText: "Hari ini",
                    onTap: (int index) {},
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
