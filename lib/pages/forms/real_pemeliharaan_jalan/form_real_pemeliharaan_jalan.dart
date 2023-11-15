import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/real_pemeliharaan_jalan/real_pemeliharaan_jalan_card/real_pemeliharaan_jalan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemeliharaan_jalan/real_pemeliharaan_jalan_form/real_pemeliharaan_jalan_form_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/real_pemeliharaan_jalan_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/butuh_tindak_lanjut_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormRealPemeliharaanJalan extends StatelessWidget {
  FormRealPemeliharaanJalan({Key? key, required this.selectedDate})
      : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController kodeAfdelingController = TextEditingController();

    TextEditingController rencanaluaspemeliharaanjalanController =
        TextEditingController();
    TextEditingController realisasiluaspemeliharaanjalanController =
        TextEditingController();
    TextEditingController penyebabController = TextEditingController();
    TextEditingController rtlController = TextEditingController();
    TextEditingController hasRtlController = TextEditingController();
    TextEditingController fotoController = TextEditingController();

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<RealPemeliharaanJalanFormCubit>().submitToDatabase(
          RealPemeliharaanJalanFormModel(
              afdeling: kodeAfdelingController.text,
              rencanaluaspemeliharaanjalan:
                  rencanaluaspemeliharaanjalanController.text,
              realisasiluaspemeliharaanjalan:
                  realisasiluaspemeliharaanjalanController.text,
              penyebab: penyebabController.text,
              rtl: rtlController.text,
              foto: fotoController.text,
              hasRtl: int.parse(hasRtlController.text)));
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

    void onChangeSelectboxAfdeling(value) {
      kodeAfdelingController.text = value!.toString();
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<RealPemeliharaanJalanFormCubit,
          RealPemeliharaanJalanFormState>(
        listener: (context, RealPemeliharaanJalanFormState) {
          if (RealPemeliharaanJalanFormState
              is LoadingRealPemeliharaanJalanFormState) {
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
          } else if (RealPemeliharaanJalanFormState
              is SuccessRealPemeliharaanJalanFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(
                context, RealPemeliharaanJalanFormState.message, () {
              BlocProvider.of<RealPemeliharaanJalanCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              Navigator.pop(context);
            });
          } else if (RealPemeliharaanJalanFormState
              is DuplicatedRealPemeliharaanJalanFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(RealPemeliharaanJalanFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (RealPemeliharaanJalanFormState
              is ErrorRealPemeliharaanJalanFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(RealPemeliharaanJalanFormState.message.toString()),
                    const Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: LoaderOverlay(
          overlayOpacity: 0.4,
          overlayColor: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: CommonColors.whiteColor,
            appBar: AppBarView(
              title: "Form Realisasi Pemeliharaan Jalan",
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
                        SelectboxAfdelingNew(
                          titleName: "Afdeling",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxAfdeling,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText:
                              'Rencana Luas Realisasi Pemeliharaan Jalan',
                          fieldKeterangan:
                              'Rencana Luas Realisasi Pemeliharaan Jalan',
                          fieldType: 'number',
                          fieldController:
                              rencanaluaspemeliharaanjalanController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText:
                              'Realisasi Luas Realisasi Pemeliharaan Jalan',
                          fieldKeterangan:
                              'Rencana Luas Realisasi Pemeliharaan Jalan',
                          fieldType: 'number',
                          fieldController:
                              realisasiluaspemeliharaanjalanController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Penyebab',
                          fieldKeterangan: 'Penyebab',
                          fieldType: 'text',
                          fieldController: penyebabController,
                        ),
                        UploadFoto(
                          fieldName: 'Evidence Realisasi Pemeliharaan Jalan',
                          imageNameController: fotoController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButuhTindakLanjutWidgetForm(
                          fieldText: 'Rencana Tindak Lanjut',
                          fieldKeterangan: 'Rencana Tindak Lanjut',
                          fieldType: 'text',
                          tindakLanjutController: rtlController,
                          hasRtlController: hasRtlController,
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
