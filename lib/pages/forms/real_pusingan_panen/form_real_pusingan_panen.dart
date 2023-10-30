import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_form/real_pemupukan_form_cubit.dart';
import 'package:patuhfy/blocs/real_pengendalian_hama/real_pengendalian_hama_card/real_pengendalian_hama_card_cubit.dart';
import 'package:patuhfy/blocs/real_pengendalian_hama/real_pengendalian_hama_form/real_pengendalian_hama_form_cubit.dart';
import 'package:patuhfy/blocs/real_pusingan_panen/real_pusingan_panen_card/real_pusingan_panen_card_cubit.dart';
import 'package:patuhfy/blocs/real_pusingan_panen/real_pusingan_panen_form/real_pusingan_panen_form_cubit.dart';
import 'package:patuhfy/blocs/selectbox_blok/selectbox_blok_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/real_pemupukan_form_model.dart';
import 'package:patuhfy/models/real_pengendalian_hama_form_model.dart';
import 'package:patuhfy/models/real_pusingan_panen_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/butuh_tindak_lanjut_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_blok.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormRealPusinganPanen extends StatelessWidget {
  FormRealPusinganPanen({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController kodeAfdelingController = TextEditingController();
    TextEditingController kodeBlokController = TextEditingController();
    TextEditingController tahunTanamController = TextEditingController();
    TextEditingController rotasipanencontroller = TextEditingController();
    TextEditingController normapusingancontroller = TextEditingController();
    TextEditingController pusingan9haricontroller = TextEditingController();
    TextEditingController pusingan10haricontroller = TextEditingController();
    TextEditingController pusingan11haricontroller = TextEditingController();
    TextEditingController pusingan12harilebihcontroller = TextEditingController();
    TextEditingController penyebabController = TextEditingController();
    TextEditingController rtlController = TextEditingController();
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

      context.read<RealPusinganPanenFormCubit>().submitToDatabase(
          RealPusinganPanenFormModel(
              afdeling: kodeAfdelingController.text,
              blok: kodeBlokController.text,
              tahunTanam: int.parse(tahunTanamController.text),
              rotasipanen: int.parse(rotasipanencontroller.text),
              normapusingan: int.parse(normapusingancontroller.text),
              pusingan9hari: int.parse(pusingan9haricontroller.text),
              pusingan10hari: int.parse(pusingan10haricontroller.text),
              pusingan11hari: int.parse(pusingan11haricontroller.text),
              pusingan12harilebih: int.parse(pusingan12harilebihcontroller.text),
              penyebab: penyebabController.text,
              rtl: rtlController.text,
              // foto: fotoController.text,
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
      BlocProvider.of<SelectboxBlokCubit>(context).setParam(value!.toString());
    }

    void onChangeSelectboxBlok(value) {
      tahunTanamController.text = value!.tahunTanam.toString();
      kodeBlokController.text = value.kodeBlok.toString();
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
      child: BlocListener<RealPusinganPanenFormCubit, RealPusinganPanenFormState>(
        listener: (context, RealPusinganPanenFormState) {
          if (RealPusinganPanenFormState is LoadingRealPusinganPanenFormState) {
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
          } else if (RealPusinganPanenFormState is SuccessRealPusinganPanenFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, RealPusinganPanenFormState.message,
                () {
              BlocProvider.of<RealPusinganPanenCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              Navigator.pop(context);
            });
          } else if (RealPusinganPanenFormState
              is DuplicatedRealPusinganPanenFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(RealPusinganPanenFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (RealPusinganPanenFormState is ErrorRealPusinganPanenFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(RealPusinganPanenFormState.message.toString()),
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
                        SelectboxBlok(
                          titleName: 'Blok',
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxBlok,
                        ),
                        TextFormFieldWidgetForm(
                            fieldText: 'Tahun Tanam',
                            fieldKeterangan: 'Tahun Tanam',
                            fieldType: 'number',
                            fieldController: tahunTanamController,
                            isEnabled: true),
                        TextFormFieldWidgetForm(
                          fieldText: 'Rotasi Panen',
                          fieldKeterangan: 'Rotasi Panen',
                          fieldType: 'number',
                          fieldController: rotasipanencontroller,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Norma Pusingan',
                          fieldKeterangan: 'Norma Pusingan',
                          fieldType: 'number',
                          fieldController: normapusingancontroller,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Pusingan 9 Hari',
                          fieldKeterangan: 'Pusingan 9 Hari',
                          fieldType: 'number',
                          fieldController: pusingan9haricontroller,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Pusingan 10 Hari',
                          fieldKeterangan: 'Pusingan 10 Hari',
                          fieldType: 'number',
                          fieldController: pusingan10haricontroller,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Pusingan 11 Hari',
                          fieldKeterangan: 'Pusingan 11 Hari',
                          fieldType: 'number',
                          fieldController: pusingan11haricontroller,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Pusingan 12 Hari Lebih',
                          fieldKeterangan: 'Pusingan 12 Hari Lebih',
                          fieldType: 'number',
                          fieldController: pusingan12harilebihcontroller,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Penyebab',
                          fieldKeterangan: 'Penyebab',
                          fieldType: 'text',
                          fieldController: penyebabController,
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
