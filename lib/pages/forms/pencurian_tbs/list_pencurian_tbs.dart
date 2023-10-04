import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_list/pencurian_tbs_list_cubit.dart';
import 'package:patuhfy/pages/forms/pencurian_tbs/form_pencurian_tbs.dart';
import 'package:patuhfy/pages/forms/pencurian_tbs/widget/pencurian_tbs_list.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';

class ListPencurianTbs extends StatelessWidget {
  const ListPencurianTbs({super.key, required this.selectedDate});

  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PencurianTbsListCubit>(context).getData(selectedDate);
    return LoaderOverlay(
      overlayOpacity: 0.4,
      overlayColor: Colors.black.withOpacity(0.4),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), //child widget inside this button
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FormPencurianTbs(
                  selectedDate: selectedDate,
                ),
              ),
            );
            //task to execute when this button is pressed
          },
        ),
        backgroundColor: CommonColors.whiteColor,
        appBar: AppBarView(
          title: "List Pencurian TBS",
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
                  PencurianTbsListView(
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
