import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/inspeksi_hanca/inspeksi_hanca_card/inspeksi_hanca_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_hanca/inspeksi_hanca_form/inspeksi_hanca_form_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
import 'package:patuhfy/blocs/selectbox_blok/selectbox_blok_cubit.dart';
import 'package:patuhfy/blocs/selectbox_pemanen/selectbox_pemanen_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/inspeksi_hanca_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_blok.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_mandor_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_pemanen_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormInspeksiHanca extends StatelessWidget {
  FormInspeksiHanca({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController kodeAfdelingController = TextEditingController();
    TextEditingController kodeBlokController = TextEditingController();
    TextEditingController tahunTanamController = TextEditingController();
    TextEditingController kavpeldController = TextEditingController();
    TextEditingController mandorController = TextEditingController();
    TextEditingController pemanenController = TextEditingController();
    TextEditingController brondolanTidakDikutipController =
        TextEditingController();
    TextEditingController buahBusukController = TextEditingController();
    TextEditingController buahLewatMatangTidakDipanenController =
        TextEditingController();
    TextEditingController buahLewatMatangTidakDiangkutKeTphController =
        TextEditingController();
    TextEditingController pelepahTidakDipotongTigaController =
        TextEditingController();
    TextEditingController pelepahTidakDiturunkanController =
        TextEditingController();

    // File pickedImage;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<InspeksiHancaFormCubit>().submitToDatabase(
            InspeksiHancaFormModel(
                afd: kodeAfdelingController.text,
                blok: kodeBlokController.text,
                tahunTanam: int.parse(tahunTanamController.text),
                kapveld: int.parse(kavpeldController.text),
                mandor: mandorController.text,
                pemanen: pemanenController.text,
                brondolanTidakDikutip:
                    int.parse(brondolanTidakDikutipController.text),
                buahBusuk: int.parse(buahBusukController.text),
                buahLewatMarangTidakDipanen:
                    int.parse(buahLewatMatangTidakDipanenController.text),
                buahLewatMatangTidakDiangkutKeTph:
                    int.parse(buahLewatMatangTidakDiangkutKeTphController.text),
                pelepahTidakDipotongTiga:
                    int.parse(pelepahTidakDipotongTigaController.text),
                pelepahTidakDiturunkan:
                    int.parse(pelepahTidakDiturunkanController.text)),
          );

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

    void onChangeSelectboxMandor(value) {
      mandorController.text = value!.toString();
      BlocProvider.of<SelectboxPemanenCubit>(context)
          .setParam(value!.toString());
    }

    void onChangeSelectboxPemanen(value) {
      pemanenController.text = value!.nikSapPemanen.toString();
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<InspeksiHancaFormCubit, InspeksiHancaFormState>(
        listener: (context, inspeksiHancaFormState) {
          if (inspeksiHancaFormState is LoadingInspeksiHancaFormState) {
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
          } else if (inspeksiHancaFormState is SuccessInspeksiHancaFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, inspeksiHancaFormState.message,
                () {
              BlocProvider.of<InspeksiHancaCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              BlocProvider.of<PerformaCubit>(context).getData();

              Navigator.pop(context);
            });
          } else if (inspeksiHancaFormState
              is DuplicatedInspeksiHancaFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(inspeksiHancaFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (inspeksiHancaFormState is ErrorInspeksiHancaFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(inspeksiHancaFormState.message.toString()),
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
              title: "Form Inspeksi Hanca",
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
                          fieldText: 'Kavpled',
                          fieldKeterangan: 'Kavpled',
                          fieldType: 'number',
                          fieldController: kavpeldController,
                        ),
                        SelectboxMandorWidget(
                          titleName: "Mandor",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxMandor,
                          // kodeMandorController: mandorController,
                        ),
                        SelectboxPemanenWidget(
                            titleName: "Pemanen",
                            isTitleName: true,
                            onChangeFunc: onChangeSelectboxPemanen
                            // fieldController: pemanenController,
                            ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Isian Inspeksi Hanca',
                          style: kTextStyle.copyWith(
                              fontSize: 15,
                              color: kTitleColor,
                              fontWeight: FontWeight.bold,
                              height: 0),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            child: Divider(
                                thickness: 1,
                                color: Color.fromARGB(229, 0, 0, 0))),
                        TextFormFieldWidgetForm(
                          fieldText: 'Brondolan Tidak dikutip',
                          fieldKeterangan: 'Brondolan Tidak dikutip',
                          fieldType: 'number',
                          fieldController: brondolanTidakDikutipController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Buah Busuk',
                          fieldKeterangan: 'Buah Busuk',
                          fieldType: 'number',
                          fieldController: buahBusukController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Buah Lewat matang tidak dipanen',
                          fieldKeterangan: 'Buah Lewat matang tidak dipanen',
                          fieldType: 'number',
                          fieldController:
                              buahLewatMatangTidakDipanenController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Buah Lewat Matang Tidak diangkut ke TPH',
                          fieldKeterangan:
                              'Buah Lewat Matang Tidak diangkut ke TPH',
                          fieldType: 'number',
                          fieldController:
                              buahLewatMatangTidakDiangkutKeTphController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText:
                              'Pelepah tidak dipotong 3 dan tidak di susun',
                          fieldKeterangan:
                              'Pelepah tidak dipotong 3 dan tidak di susun',
                          fieldType: 'number',
                          fieldController: pelepahTidakDipotongTigaController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Pelepah tidak di turunkan',
                          fieldKeterangan: 'Pelepah tidak di turunkan',
                          fieldType: 'number',
                          fieldController: pelepahTidakDiturunkanController,
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
