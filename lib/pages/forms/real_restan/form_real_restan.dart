import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/real_restan/real_restan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/real_restan/real_restan_form/real_restan_form_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/real_restan_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/butuh_tindak_lanjut_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormRealRestan extends StatelessWidget {
  FormRealRestan({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController kodeAfdelingController = TextEditingController();
    TextEditingController jmlTandanDipanenController = TextEditingController();
    TextEditingController jmlTandanDiangkutController = TextEditingController();
    TextEditingController restanKemarinController = TextEditingController();

    TextEditingController ketKendalaController = TextEditingController();
    TextEditingController rtlController = TextEditingController();
    TextEditingController kapasitasAngkutanPertonController =
        TextEditingController();
    TextEditingController kebutuhanArmadaAngkutController =
        TextEditingController();
    TextEditingController hasRtlController = TextEditingController();

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

      context.read<RealRestanFormCubit>().submitToDatabase(RealRestanFormModel(
          afdeling: kodeAfdelingController.text,
          jmlTandanDipanen: int.parse(jmlTandanDipanenController.text),
          jmlTandanDiangkut: int.parse(jmlTandanDiangkutController.text),
          restanKemarin: int.parse(restanKemarinController.text),
          restanHi: int.parse(jmlTandanDipanenController.text) -
              int.parse(jmlTandanDiangkutController.text),
          restanTotal: int.parse(restanKemarinController.text) +
              (int.parse(jmlTandanDipanenController.text) -
                  int.parse(jmlTandanDiangkutController.text)),
          ketKendala: ketKendalaController.text,
          ketTindakLanjut: rtlController.text,
          kapasitasAngkutanPerton:
              int.parse(kapasitasAngkutanPertonController.text),
          kebutuhanArmadaAngkut:
              int.parse(kebutuhanArmadaAngkutController.text),
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
      child: BlocListener<RealRestanFormCubit, RealRestanFormState>(
        listener: (context, RealRestanFormState) {
          if (RealRestanFormState is LoadingRealRestanFormState) {
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
          } else if (RealRestanFormState is SuccessRealRestanFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, RealRestanFormState.message,
                () {
              BlocProvider.of<RealRestanCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              Navigator.pop(context);
            });
          } else if (RealRestanFormState is DuplicatedRealRestanFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(RealRestanFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (RealRestanFormState is ErrorRealRestanFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(RealRestanFormState.message.toString()),
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
              title: "Form Realisasi Restan",
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
                          fieldText: 'Jumlah Tandan Dipananen',
                          fieldKeterangan: 'Jumlah Tandan Dipananen',
                          fieldType: 'number',
                          fieldController: jmlTandanDipanenController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Jumlah Tandan diangkut',
                          fieldKeterangan: 'Jumlah Tandan diangkut',
                          fieldType: 'number',
                          fieldController: jmlTandanDiangkutController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Restan Kemarin',
                          fieldKeterangan: 'Restan Kemarin',
                          fieldType: 'number',
                          fieldController: restanKemarinController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'kapasitas angkutan Per-TON',
                          fieldKeterangan: 'kapasitas angkutan Per-TON',
                          fieldType: 'number',
                          fieldController: kapasitasAngkutanPertonController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'kebutuhan armada angkut',
                          fieldKeterangan: 'kebutuhan armada angkut',
                          fieldType: 'number',
                          fieldController: kebutuhanArmadaAngkutController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Keterangan Kendala',
                          fieldKeterangan: 'Keterangan Kendala',
                          fieldType: 'text',
                          fieldController: ketKendalaController,
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
