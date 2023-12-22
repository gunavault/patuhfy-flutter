import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/pelaporan_kerusakan_alat/analisa_kerusakan_alat_form/analisa_kerusakan_alat_form_cubit.dart';
import 'package:patuhfy/blocs/pelaporan_kerusakan_alat/analisa_kerusakan_alat_list/analisa_kerusakan_alat_list_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_form/rtl_detail_form_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/analisa_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/rtl_detail_form_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/forms/widget_form/datepicker_form_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_file_field.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_jenis_kerusakan.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_suku_cadang.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';
import 'package:dropdown_search/dropdown_search.dart';


class FormAnalisakerusakanAlatForm extends StatelessWidget {
  FormAnalisakerusakanAlatForm({Key? key, required this.dataPelaporanKerusakanAlat}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final PelaporanKerusakanAlatFormModel dataPelaporanKerusakanAlat;
  @override
  Widget build(BuildContext context) {
    TextEditingController rowstampAcuanController = TextEditingController();
    TextEditingController jeniskerusakanController = TextEditingController();
    TextEditingController estimasipenyelesaianController = TextEditingController();
    TextEditingController ketersediansukucadangController = TextEditingController();
    TextEditingController detailkerusakanController = TextEditingController();

    // File pickedImage;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      rowstampAcuanController.text = dataPelaporanKerusakanAlat.rowstamp.toString();


      context.read<AnalisakerusakanAlatFormCubit>().submitToDatabase(
            AnalisaKerusakanAlatModel(
              rowslaporan: rowstampAcuanController.text,
              jeniskerusakan: jeniskerusakanController.text,
              estimasipenyelesaian: estimasipenyelesaianController.text,
              ketersediansukucadang: ketersediansukucadangController.text,
              detailkerusakan: detailkerusakanController.text,
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
        void onChangeSelectboxJenisKerusakan(value) {
      jeniskerusakanController.text = value!.toString();
    }
        void onChangeSelectboxSukuCadang(value) {
      ketersediansukucadangController.text = value!.toString();
    }

    // void onChangeSelectboxAfdeling(value) {
    //   kodeAfdelingController.text = value!.toString();
    //   BlocProvider.of<SelectboxBlokCubit>(context).setParam(value!.toString());
    // }

    void _onSuccessSubmit(message) {
      showAlertSuccessOkActionV2(context, message, () {
        BlocProvider.of<AnalisakerusakanAlatListCubit>(context).getData(dataPelaporanKerusakanAlat);
        Navigator.pop(context);
      });
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<AnalisakerusakanAlatFormCubit, AnalisakerusakanAlatFormState>(
        listener: (context, AnalisakerusakanAlatFormState) {
          if (AnalisakerusakanAlatFormState is LoadingAnalisakerusakanAlatFormState) {
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
          } else if (AnalisakerusakanAlatFormState is SuccessAnalisakerusakanAlatFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _onSuccessSubmit(AnalisakerusakanAlatFormState.message);
            // showAlertSuccessOkActionV2(context, AnalisakerusakanAlatFormState.message, () {
            //   Navigator.pop(context);
            // });
          } else if (AnalisakerusakanAlatFormState is DuplicatedAnalisakerusakanAlatFormState) {
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
          } else if (AnalisakerusakanAlatFormState is ErrorAnalisakerusakanAlatFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AnalisakerusakanAlatFormState.message.toString()),
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
              title: "Form Analisa Kerusakan Alat",
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
                        SelectboxJenisKerusakan(
                          titleName: "Jenis Kerusakan",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxJenisKerusakan,
                        ),
                        
                        TextFormFieldWidgetForm(
                          maxLines: 1,
                          fieldText: 'Estimasi Penyelesaian (JAM)',
                          fieldKeterangan: 'Estimasi Penyelesaian',
                          fieldType: 'number',
                          fieldController: estimasipenyelesaianController,
                        ),
                        SelectboxSukuCadang(
                          titleName: "Jenis Kerusakan",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxSukuCadang),
                        TextFormFieldWidgetForm(
                          maxLines: 3,
                          fieldText: 'Detail Kerusakan',
                          fieldKeterangan: 'Detail Kerusakan',
                          fieldType: 'text',
                          fieldController: detailkerusakanController,
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
