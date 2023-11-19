import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/selectbox_waktu_pengamatan/selectbox_waktu_pengamatan_cubit.dart';
import 'package:patuhfy/models/waktu_pengamatan_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/text_style.dart';

class SelectboxWaktuPengamatan extends StatelessWidget {
  const SelectboxWaktuPengamatan(
      {super.key,
      this.titleName,
      this.isTitleName,
      required this.onChangeFunc});

  final String? titleName;
  final bool? isTitleName;
  final Function? onChangeFunc;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SelectboxWaktuPengamatanCubit>(context).getData();
    Widget _customPopupItemBuilderExample2(
        BuildContext context, WaktuPengamatanModel item, bool isSelected) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
        child: ListTile(
          selected: isSelected,
          title: Text(item.kodeWaktuPengamatan.toString()),
          leading: const CircleAvatar(
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
        DropdownSearch<WaktuPengamatanModel>(
          validator: (value) {
            if (value == null) {
              return 'Waktu Pengamatan Tidak Boleh kosong';
            }
            return null;
          },
          onChanged: (value) {
            onChangeFunc!(value);
          },
          asyncItems: (String? filter) =>
              BlocProvider.of<SelectboxWaktuPengamatanCubit>(context).getData(),
          popupProps: PopupPropsMultiSelection.modalBottomSheet(
            showSelectedItems: true,
            itemBuilder: _customPopupItemBuilderExample2,
            showSearchBox: true,
          ),
          compareFn: (item, sItem) =>
              item.kodeWaktuPengamatan == sItem.kodeWaktuPengamatan,
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
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:
                    const BorderSide(color: CommonColors.redColor, width: 0.5),
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
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
