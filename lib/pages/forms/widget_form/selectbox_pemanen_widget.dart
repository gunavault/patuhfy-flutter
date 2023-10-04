import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/selectbox_pemanen/selectbox_pemanen_cubit.dart';
import 'package:patuhfy/models/pemanen_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class SelectboxPemanenWidget extends StatelessWidget {
  const SelectboxPemanenWidget(
      {super.key,
      this.titleName,
      this.isTitleName,
      required this.onChangeFunc});

  final String? titleName;
  final bool? isTitleName;
  // final TextEditingController fieldController;
  final Function? onChangeFunc;
  // final String parameterController;

  @override
  Widget build(BuildContext context) {
    Widget _customPopupItemBuilderExample2(
        BuildContext context, PemanenModel item, bool isSelected) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
        child: ListTile(
          selected: isSelected,
          title: Text(
              '${item.namaPemanen.toString()} (${item.nikSapPemanen.toString()})'),
          leading: CircleAvatar(
            radius: 13,
            child: Icon(
              size: 12,
              Icons.add,
            ),
            // backgroundImage: NetworkImage(item.avatar.toString()),
          ),
        ),
      );
    }

    return BlocBuilder<SelectboxPemanenCubit, SelectboxPemanenState>(
      builder: (context, state) {
        if (state is SetParamSBState) {
          BlocProvider.of<SelectboxPemanenCubit>(context)
              .getData(state.kodeMandor);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isTitleName == true
                  ? Text(
                      titleName!,
                      style: CommonStyle.getRalewayFont(
                        color: CommonColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              DropdownSearch<PemanenModel>(
                validator: (value) {
                  if (value is Null) {
                    return 'Pemanen Tidak Boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  onChangeFunc!(value);
                },
                asyncItems: (String? filter) =>
                    BlocProvider.of<SelectboxPemanenCubit>(context)
                        .getData(state.kodeMandor),
                    itemAsString: (PemanenModel u) => u.userAsString(),

                popupProps: PopupPropsMultiSelection.modalBottomSheet(
                  showSelectedItems: true,
                  itemBuilder: _customPopupItemBuilderExample2,
                  showSearchBox: true,
                ),
                compareFn: (item, sItem) =>
                    item.nikSapPemanen == sItem.nikSapPemanen,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 15, right: 18, top: 16, bottom: 16),
                    labelText: titleName,
                    fillColor: Colors.transparent,
                    hintStyle: CommonStyle.getRalewayFont(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 0.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: CommonColors.redColor, width: 0.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: CommonColors.redColor, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: CommonColors.textGeryColor, width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: CommonColors.textGeryColor, width: 0.5),
                    ),
                    filled: true,
                    // fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        }

        return Text('Loading..');
      },
    );
  }
}
