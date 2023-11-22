import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/cek_monitoring_ipal/cek_monitoring_ipal_form/cek_sampel_ipal_form_cubit.dart';
import 'package:patuhfy/blocs/cek_monitoring_ipal/cek_sampel_losis_card/cek_monitoring_ipal_card_cubit.dart';
import 'package:patuhfy/blocs/cek_rutin_sortasi/cek_rutin_sortasi_card/cek_rutin_sortasi_card_cubit.dart';
import 'package:patuhfy/blocs/cek_rutin_sortasi/cek_rutin_sortasi_form/cek_rutin_sortasi_form_cubit.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_card/cek_sampel_losis_card_cubit.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_form/estetika_pabrik_form_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_card/estetika_pabrik_card_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_form/estetika_pabrik_form_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
import 'package:patuhfy/blocs/selectbox_afdeling_pengolahan/selectbox_afdeling_pengolahan_cubit.dart';
import 'package:patuhfy/blocs/selectbox_blok_pengolahan/selectbox_blok_pengolahan_cubit.dart';
import 'package:patuhfy/blocs/selectbox_jenis_sampel/selectbox_jenis_sampel_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/cek_monitoring_ipal.dart';
import 'package:patuhfy/models/cek_rutin_sortasi.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_jenis_kebersihan.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_afdeling_pengolahan.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_blok_pengolahan.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_kebun.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_sampel_losis.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_jenis_sampel.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_stasiun.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_waktu_pengamatan.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormCekRutinSortasi extends StatelessWidget {
  FormCekRutinSortasi({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    
    TextEditingController imageNameController = TextEditingController();
    TextEditingController kodeWaktuPengamatanController = TextEditingController();
    TextEditingController kebunController = TextEditingController();
    TextEditingController afdelingController = TextEditingController();
    TextEditingController blokController = TextEditingController();
    TextEditingController tahuntanamController = TextEditingController();
    TextEditingController nopolisiController = TextEditingController();
    TextEditingController tandandarikebunController = TextEditingController();
    TextEditingController tandandariPKSController = TextEditingController();
    TextEditingController tbsmentahController = TextEditingController();
    TextEditingController tbsmatangController = TextEditingController();
    TextEditingController tbslewatmatangController = TextEditingController();
    TextEditingController tbskecilController = TextEditingController();
    TextEditingController tangkaipanjangController = TextEditingController();
    TextEditingController brondolanController = TextEditingController();
    // File pickedImage;
    String? pickedImageBase64Image;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<CekRutinSortasiFormCubit>().submitToDatabase(
            CekRutinSortasiFormModel(
                waktupengamatan: kodeWaktuPengamatanController.text,
                kebun: kebunController.text,
                afdeling: afdelingController.text,
                blok: blokController.text,
                tahuntanam: tahuntanamController.text,
                nopolisi: nopolisiController.text,
                jumlahtandandarikebun: tandandarikebunController.text,
                jumlahtandanpks: tandandariPKSController.text,
                tbsmentah: tbsmentahController.text,
                tbsmatang: tbsmatangController.text,
                tbslewatmatang: tbslewatmatangController.text,
                tbskecil: tbskecilController.text,
                tangkaipanjang: tangkaipanjangController.text,
                brondolan: brondolanController.text,
                foto64: imageNameController.text),
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



    void onChangeSelectboxWaktuPengamatan(value) {
      kodeWaktuPengamatanController.text = value!.toString();
    }
    void onChangeSelectboxKebun(value) {
      kebunController.text = value!.toString();
      BlocProvider.of<SelectboxAfdelingPengolahanCubit>(context).setParam(value!.toString());

    }
    void onChangeSelectboxAfdeling(value) {
      afdelingController.text = value!.toString();
      BlocProvider.of<SelectboxBlokPengolahanCubit>(context).setParam(kebunController.text,value!.toString());

    }
    void onChangeSelectboxBlok(value) {
      blokController.text = value!.toString();
      tahuntanamController.text = value!.tahunTanam.toString();

    }



    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<CekRutinSortasiFormCubit, CekRutinSortasiFormState>(
        listener: (context, CekRutinSortasiFormState) {
          if (CekRutinSortasiFormState is LoadingCekRutinSortasiFormState) {
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
          } else if (CekRutinSortasiFormState
              is SuccessCekRutinSortasiFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, CekRutinSortasiFormState.message,
                () {
              BlocProvider.of<CekRutinSortasiCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              BlocProvider.of<PerformaCubit>(context).getData();

              Navigator.pop(context);
            });
          } else if (CekRutinSortasiFormState
              is DuplicatedCekRutinSortasiFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(CekRutinSortasiFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (CekRutinSortasiFormState is ErrorCekRutinSortasiFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(CekRutinSortasiFormState.message.toString()),
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
              title: "Form Monitoring Ipal",
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
                        SelectboxWaktuPengamatan(
                          titleName: "Waktu Pengamatan",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxWaktuPengamatan,
                        ),
                        SelectboxKebun(
                          titleName: "Kebun",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxKebun,
                        ),
                          SelectboxAfdelingPengolahan(
                          titleName: "Afdeling",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxAfdeling,
                          ),
                          SelectboxBlokPengolahan(
                          titleName: "Blok",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxBlok,
                          ),
                                                TextFormFieldWidgetForm(
                            fieldText: 'Tahun Tanam',
                            fieldKeterangan: 'Tahun Tanam',
                            fieldType: 'number',
                            fieldController: tahuntanamController,
                            isEnabled: true),
                          TextFormFieldWidgetForm(
                            fieldText: 'no polisi',
                            fieldKeterangan: 'no polisi',
                            fieldType: 'number',
                            fieldController: nopolisiController),
                          TextFormFieldWidgetForm(
                            fieldText: 'jumlah tandan dari kebun',
                            fieldKeterangan: 'jumlah tandan dari kebun',
                            fieldType: 'number',
                            fieldController: tandandarikebunController),
                          TextFormFieldWidgetForm(
                            fieldText: 'Jumlah tandan di PKS',
                            fieldKeterangan: 'Jumlah tandan di PKS',
                            fieldType: 'number',
                            fieldController: tandandariPKSController),
                        TextFormFieldWidgetForm(
                          fieldText: 'TBS Mentah',
                          fieldKeterangan: 'TBS Mentah',
                          fieldType: 'number',
                          fieldController: tbsmentahController,
                        ),
                        TextFormFieldWidgetForm(
                            fieldText: 'TBS MATANG',
                            fieldKeterangan: 'TBS MATANG',
                            fieldType: 'number',
                            fieldController: tbsmatangController),
                        TextFormFieldWidgetForm(
                          fieldText: 'TBS lewat Matang',
                          fieldKeterangan: 'TBS lewat Matang',
                          fieldType: 'number',
                          fieldController: tbslewatmatangController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'TBS Kecil / Promosi',
                          fieldKeterangan: 'TBS Kecil / Promosi',
                          fieldType: 'number',
                          fieldController: tbskecilController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Tangkai Panjang',
                          fieldKeterangan: 'Tangkai Panjang',
                          fieldType: 'number',
                          fieldController: tangkaipanjangController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Brondolan',
                          fieldKeterangan: 'Brondolan',
                          fieldType: 'number',
                          fieldController: brondolanController,
                        ),
                        
                        UploadFoto(
                          fieldName: 'Evidence Foto',
                          imageNameController: imageNameController,
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
