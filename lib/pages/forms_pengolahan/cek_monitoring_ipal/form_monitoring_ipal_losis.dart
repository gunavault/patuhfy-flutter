import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/cek_monitoring_ipal/cek_monitoring_ipal_form/cek_sampel_ipal_form_cubit.dart';
import 'package:patuhfy/blocs/cek_monitoring_ipal/cek_sampel_losis_card/cek_monitoring_ipal_card_cubit.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_card/cek_sampel_losis_card_cubit.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_form/estetika_pabrik_form_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_card/estetika_pabrik_card_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_form/estetika_pabrik_form_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
import 'package:patuhfy/blocs/selectbox_jenis_sampel/selectbox_jenis_sampel_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/cek_monitoring_ipal.dart';
import 'package:patuhfy/models/cek_sampel_losis_model.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_sampel_losis.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_jenis_sampel.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_stasiun.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_waktu_pengamatan.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormCekMonitoringIpal extends StatelessWidget {
  FormCekMonitoringIpal({Key? key, required this.selectedDate})
      : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController imageNameController = TextEditingController();
    TextEditingController kodeWaktuPengamatanController =
        TextEditingController();
    TextEditingController debitairmasukController = TextEditingController();
    TextEditingController debitairkeluarController = TextEditingController();
    TextEditingController PHController = TextEditingController();
    TextEditingController TemperatureController = TextEditingController();
    // File pickedImage;
    String? pickedImageBase64Image;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<CekMonitoringIpalFormCubit>().submitToDatabase(
            CekMonitoringIpalFormModel(
                waktuPengamatan: kodeWaktuPengamatanController.text,
                debitairmasuk: debitairmasukController.text,
                debitairkeluar: debitairkeluarController.text,
                ph: PHController.text,
                temperatur: TemperatureController.text,
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

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child:
          BlocListener<CekMonitoringIpalFormCubit, CekMonitoringIpalFormState>(
        listener: (context, CekMonitoringIpalFormState) {
          if (CekMonitoringIpalFormState is LoadingCekMonitoringIpalFormState) {
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
          } else if (CekMonitoringIpalFormState
              is SuccessCekMonitoringIpalFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(
                context, CekMonitoringIpalFormState.message, () {
              BlocProvider.of<CekMonitoringIpalCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              BlocProvider.of<PerformaCubit>(context).getData();

              Navigator.pop(context);
            });
          } else if (CekMonitoringIpalFormState
              is DuplicatedCekMonitoringIpalFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(CekMonitoringIpalFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (CekMonitoringIpalFormState
              is ErrorCekMonitoringIpalFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(CekMonitoringIpalFormState.message.toString()),
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
                        TextFormFieldWidgetForm(
                            fieldText: 'Debit Air Masuk',
                            fieldKeterangan: 'Debit Air Masuk',
                            fieldType: 'number',
                            fieldController: debitairmasukController),
                        TextFormFieldWidgetForm(
                          fieldText: 'Debit Air Keluar',
                          fieldKeterangan: 'Debit Air Keluar',
                          fieldType: 'number',
                          fieldController: debitairkeluarController,
                        ),
                        TextFormFieldWidgetForm(
                            fieldText: 'PH',
                            fieldKeterangan: 'PH',
                            fieldType: 'number',
                            fieldController: PHController),
                        TextFormFieldWidgetForm(
                          fieldText: 'Temperatur',
                          fieldKeterangan: 'Temperatur',
                          fieldType: 'number',
                          fieldController: TemperatureController,
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
