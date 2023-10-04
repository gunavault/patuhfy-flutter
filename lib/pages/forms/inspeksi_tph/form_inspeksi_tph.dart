import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_card/inspeksi_tph_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_form/inspeksi_tph_form_cubit.dart';
import 'package:patuhfy/blocs/selectbox_blok/selectbox_blok_cubit.dart';
import 'package:patuhfy/blocs/selectbox_pemanen/selectbox_pemanen_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_blok.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_mandor_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_pemanen_widget.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormInspeksiTph extends StatelessWidget {
  FormInspeksiTph({Key? key, required this.selectedDate}) : super(key: key);
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
    TextEditingController noTphController = TextEditingController();

    TextEditingController panenBuahSangatMentahController =
        TextEditingController();
    TextEditingController tbsBusukController = TextEditingController();
    TextEditingController gagangTandanPanjangController =
        TextEditingController();
    TextEditingController tbsTidakDiberiNomorController =
        TextEditingController();
    TextEditingController tbsTidakDisusunRapiController =
        TextEditingController();
    TextEditingController tangkaiTidakBerbentukVController =
        TextEditingController();

    // File pickedImage;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<InspeksiTphFormCubit>().submitToDatabase(
            InspeksiTphFormModel(
                afd: kodeAfdelingController.text,
                blok: kodeBlokController.text,
                tahunTanam: int.parse(tahunTanamController.text),
                kapveld: int.parse(kavpeldController.text),
                mandor: mandorController.text,
                pemanen: pemanenController.text,
                noTph: int.parse(noTphController.text),
                panenBuahSangatMentah:
                    int.parse(panenBuahSangatMentahController.text),
                tbsBusuk: int.parse(tbsBusukController.text),
                gagangTandanPanjang:
                    int.parse(gagangTandanPanjangController.text),
                tbsTidakDiberiNomor:
                    int.parse(tbsTidakDiberiNomorController.text),
                tbsTidakDisusunRapi:
                    int.parse(tbsTidakDisusunRapiController.text),
                tangkaiTidakBerbentukV:
                    int.parse(tangkaiTidakBerbentukVController.text)),
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
      child: BlocListener<InspeksiTphFormCubit, InspeksiTphFormState>(
        listener: (context, InspeksiTphFormState) {
          if (InspeksiTphFormState is LoadingInspeksiTphFormState) {
            print('ke sini');
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
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
          } else if (InspeksiTphFormState is SuccessInspeksiTphFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, InspeksiTphFormState.message,
                () {
              BlocProvider.of<InspeksiTphCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              Navigator.pop(context);
            });
          } else if (InspeksiTphFormState is DuplicatedInspeksiTphFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
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
          } else if (InspeksiTphFormState is ErrorInspeksiTphFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(InspeksiTphFormState.message.toString()),
                    Icon(Icons.error)
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
              title: "Form Inspeksi TPH",
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
                        TextFormFieldWidgetForm(
                          fieldText: 'No TPH',
                          fieldKeterangan: 'No TPh',
                          fieldType: 'number',
                          fieldController: noTphController,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Isian Inspeksi TPH',
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
                          fieldText: 'Panen Buah Sangat Mentah',
                          fieldKeterangan: 'Panen Buah Sangat Mentah',
                          fieldType: 'number',
                          fieldController: panenBuahSangatMentahController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'TBS Busuk',
                          fieldKeterangan: 'TBS Busuk',
                          fieldType: 'number',
                          fieldController: tbsBusukController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Gagang Tandan Panjang',
                          fieldKeterangan: 'Gagang Tandan Panjang',
                          fieldType: 'number',
                          fieldController: gagangTandanPanjangController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'TBS Tidak Diberi Nomor',
                          fieldKeterangan: 'TBS Tidak Diberi Nomor',
                          fieldType: 'number',
                          fieldController: tbsTidakDiberiNomorController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'TBS Tidak Disusun Rapi',
                          fieldKeterangan: 'TBS Tidak Disusun Rapi',
                          fieldType: 'number',
                          fieldController: tbsTidakDisusunRapiController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Tangkai Tidak Berbentuk V',
                          fieldKeterangan: 'Tangkai Tidak Berbentuk V',
                          fieldType: 'number',
                          fieldController: tangkaiTidakBerbentukVController,
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
