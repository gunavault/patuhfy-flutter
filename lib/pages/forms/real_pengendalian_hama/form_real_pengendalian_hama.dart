import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_form/real_pemupukan_form_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/butuh_tindak_lanjut_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormRealPemupukan extends StatelessWidget {
  FormRealPemupukan({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController kodeAfdelingController = TextEditingController();
    TextEditingController kodeBlokController = TextEditingController();
    TextEditingController tahunTanamController = TextEditingController();
    TextEditingController luasController = TextEditingController();
    TextEditingController rencanaLuasPemupukanController =
        TextEditingController();
    TextEditingController realisasiLuasPemupukanController =
        TextEditingController();
    TextEditingController penyebabController = TextEditingController();
    TextEditingController rtlController = TextEditingController();
    TextEditingController hasRtlController = TextEditingController();
    TextEditingController fotoController = TextEditingController();
    // TextEditingController buahLewatMatangTidakDiangkutKeTphController =
    //     TextEditingController();
    // TextEditingController pelepahTidakDipotongTigaController =
    //     TextEditingController();
    // TextEditingController pelepahTidakDiturunkanController =
    //     TextEditingController();

    // File pickedImage;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());
      //, rencanaLuasPemupukan: int.parse(rencanaLuasPemupukanController.text), realisasiLuasPemupukan: int.parse(realisasiLuasPemupukanController.text),

      context.read<RealPemupukanFormCubit>().submitToDatabase(
          RealPemupukanFormModel(
              afdeling: kodeAfdelingController.text,
              rencanaLuasPemupukan:
                  int.parse(rencanaLuasPemupukanController.text),
              realisasiLuasPemupukan:
                  int.parse(realisasiLuasPemupukanController.text),
              penyebab: penyebabController.text,
              rtl: rtlController.text,
              foto: fotoController.text,
              hasRtl: int.parse(hasRtlController.text)));

      // _loginBloc.add(LoginPressed(_loginData));
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

    // void onChangeSelectboxBlok(BlokModel value) {
    //   tahunTanamController.text = value.tahunTanam.toString();
    //   kodeBlokController.text = value.kodeBlok.toString();
    //   luasController.text = value.luasArealTanam.toString();
    // }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<RealPemupukanFormCubit, RealPemupukanFormState>(
        listener: (context, RealPemupukanFormState) {
          if (RealPemupukanFormState is LoadingRealPemupukanFormState) {
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
          } else if (RealPemupukanFormState is SuccessRealPemupukanFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, RealPemupukanFormState.message,
                () {
              BlocProvider.of<RealPemupukanCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              Navigator.pop(context);
            });
          } else if (RealPemupukanFormState
              is DuplicatedRealPemupukanFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(RealPemupukanFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (RealPemupukanFormState is ErrorRealPemupukanFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(RealPemupukanFormState.message.toString()),
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
              title: "Form Realisasi Pemupukan",
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
                          fieldText: 'Rencana Luas Pemupukan',
                          fieldKeterangan: 'Rencana Luas Pemupukan',
                          fieldType: 'number',
                          fieldController: rencanaLuasPemupukanController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Realisasi Luas Pemupukan',
                          fieldKeterangan: 'Realisasi Luas Pemupukan',
                          fieldType: 'number',
                          fieldController: realisasiLuasPemupukanController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Penyebab',
                          fieldKeterangan: 'Penyebab',
                          fieldType: 'text',
                          fieldController: penyebabController,
                        ),
                        UploadFoto(
                          fieldName: 'Evidence Pemupukan',
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
