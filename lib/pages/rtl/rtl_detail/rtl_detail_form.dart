import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_form/rtl_detail_form_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/rtl_detail_form_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/forms/widget_form/date_picker_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/datepicker_form_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_file_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormRtlDetailForm extends StatelessWidget {
  FormRtlDetailForm({Key? key, required this.dataRtl}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final RtlListModel dataRtl;
  @override
  Widget build(BuildContext context) {
    TextEditingController rowstampAcuanController = TextEditingController();
    TextEditingController tanggalRtlController = TextEditingController();
    TextEditingController deskripsiRtlController = TextEditingController();
    TextEditingController tanggalRealisasiController = TextEditingController();
    TextEditingController deskripsiRealisasiController =
        TextEditingController();
    TextEditingController evidenceController = TextEditingController();

    // File pickedImage;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      rowstampAcuanController.text = dataRtl.rowstamp.toString();
      deskripsiRtlController.text = dataRtl.deskripsi.toString();
      tanggalRtlController.text = dataRtl.mobileCreatedAt.toString();

      context.read<RtlDetailFormCubit>().submitToDatabase(
            RtlDetailFormModel(
              rowstampAcuan: rowstampAcuanController.text,
              tanggalRtl: tanggalRtlController.text,
              deskripsiRtl: deskripsiRtlController.text,
              tanggalRealisasi: tanggalRealisasiController.text,
              deskripsiRealisasi: deskripsiRealisasiController.text,
              evidence: evidenceController.text,
            ),
          );
    }

    void _submit() {
      final form = _formKey.currentState;

      if (form!.validate()) {
        context.loaderOverlay.show();

        form.save();
        _postToDatabase();
      } else {
        // setState(() => _autovalidate = true);
      }
    }

    // void onChangeSelectboxAfdeling(value) {
    //   kodeAfdelingController.text = value!.toString();
    //   BlocProvider.of<SelectboxBlokCubit>(context).setParam(value!.toString());
    // }

    void _onSuccessSubmit(message) {
      showAlertSuccessOkActionV2(context, message, () {
        BlocProvider.of<RtlDetailListCubit>(context).getData(dataRtl);
        Navigator.pop(context);
      });
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<RtlDetailFormCubit, RtlDetailFormState>(
        listener: (context, RtlDetailFormState) {
          if (RtlDetailFormState is LoadingRtlDetailFormState) {
            print('ke sini');
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  // duration: Duration(seconds: 4),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Menyimpan Data...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          } else if (RtlDetailFormState is SuccessRtlDetailFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _onSuccessSubmit(RtlDetailFormState.message);
            // showAlertSuccessOkActionV2(context, RtlDetailFormState.message, () {
            //   Navigator.pop(context);
            // });
          } else if (RtlDetailFormState is DuplicatedRtlDetailFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Oops, data gagal tersimpan."),
                      Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (RtlDetailFormState is ErrorRtlDetailFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(RtlDetailFormState.message.toString()),
                    const Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
            context.loaderOverlay.hide();
          }
        },
        child: LoaderOverlay(
          overlayOpacity: 0.4,
          overlayColor: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: CommonColors.whiteColor,
            appBar: AppBarView(
              title: "Form Detail RTL",
              firstIcon: Icons.arrow_back_ios_new_rounded,
              onBackPress: () {
                Navigator.pop(context);
              },
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, left: 26, right: 26, bottom: 10),
                    child: Column(
                      children: [
                        TextFormFieldWidgetForm(
                          maxLines: 3,
                          fieldText: 'DESKRIPSI REALISASI',
                          fieldKeterangan: 'Deskripsi Realisasi ',
                          fieldType: 'text',
                          fieldController: deskripsiRealisasiController,
                        ),
                        DatepickerFormWidget(
                          fieldController: tanggalRealisasiController,
                          fieldKeterangan: 'Tanggal Realisasi',
                          fieldText: 'Tanggal Realisasi',
                        ),
                        // TextFormFieldWidgetForm(
                        //   fieldText: 'TANGGAL REALISASI',
                        //   fieldKeterangan: 'Tanggal Realisasi',
                        //   fieldType: 'text',
                        //   fieldController: tanggalRealisasiController,
                        // ),
                        UploadFileFieldWidget(
                          fieldName: 'Evidence',
                          fileController: evidenceController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 30),
                          child: SizedBox(
                            height: 46,
                            child: PrimaryButton(
                              buttonText: "Simpan",
                              callBack: _submit,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Future<Null> _selectDateOrder(BuildContext context) async {
//   var firstDate =
//       DateTime(initialDate.year, initialDate.month - 3, initialDate.day);
//   var lastDate =
//       DateTime(initialDate.year, initialDate.month, initialDate.day + 7);
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: _selectedDate,
//     firstDate: firstDate,
//     lastDate: lastDate,
//     builder: (BuildContext context, Widget? child) {
//       return Theme(
//         data: ThemeData.light().copyWith(
//           primaryColor: Colors.blue,
//           colorScheme:
//               ColorScheme.light(primary: Colors.blue, secondary: Colors.blue),
//           buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
//         ),
//         child: child!,
//       );
//     },
//   );
//   if (picked != null && picked != _selectedDate) {
//     setState(() {
//       _selectedDate = picked;
//       widget.formRequestTransferModel.tglOrder =
//           _selectedDate.toLocal().toString().split(' ')[0];

//       _tglOrder = TextEditingController(
//           text: _selectedDate.toLocal().toString().split(' ')[0]);
//     });
//   }
// }
