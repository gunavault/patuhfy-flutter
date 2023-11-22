import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_form/estetika_pabrik_form_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
import 'package:patuhfy/blocs/proses_pengolahan/proses_pengolahan_card/proses_pengolahan_card_cubit.dart';
import 'package:patuhfy/blocs/proses_pengolahan/proses_pengolahan_form/proses_pengolahan_form_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/models/proses_pengolahan_form_model.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_jenis_kebersihan.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_kondisi_proses.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_stasiun.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_tenaga_pengoperasian.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_waktu_pengamatan.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormProsesPengolahan extends StatelessWidget {
  FormProsesPengolahan({Key? key, required this.selectedDate})
      : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController imageNameController = TextEditingController();
    TextEditingController kodeStasiunController = TextEditingController();
    TextEditingController kodeWaktuPengamatanController =
        TextEditingController();
    TextEditingController kodeTenagaKerjaController = TextEditingController();
    TextEditingController kodeKondisiProses = TextEditingController();

    // File pickedImage;
    String? pickedImageBase64Image;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<ProsesPengolahanFormCubit>().submitToDatabase(
            ProsesPengolahanFormModel(
                stasiun: kodeStasiunController.text,
                waktuPengamatan: kodeWaktuPengamatanController.text,
                tenagaKerjaPengoperasian: kodeTenagaKerjaController.text,
                kondisiProses: kodeKondisiProses.text,
                foto: imageNameController.text),
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

    void onChangeSelectboxStasiun(value) {
      kodeStasiunController.text = value!.toString();
    }

    void onChangeSelectboxWaktuPengamatan(value) {
      kodeWaktuPengamatanController.text = value!.toString();
    }

    void onChangeSelectboxTenagaKerjaPengoperasian(value) {
      kodeTenagaKerjaController.text = value!.toString();
    }

    void onChangeSelectboxKondisiProses(value) {
      kodeKondisiProses.text = value!.toString();
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<ProsesPengolahanFormCubit, ProsesPengolahanFormState>(
        listener: (context, ProsesPengolahanFormState) {
          if (ProsesPengolahanFormState is LoadingProsesPengolahanFormState) {
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
          } else if (ProsesPengolahanFormState
              is SuccessProsesPengolahanFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(
                context, ProsesPengolahanFormState.message, () {
              BlocProvider.of<PerformaCubit>(context).getData();

              Navigator.pop(context);
            });
          } else if (ProsesPengolahanFormState
              is DuplicatedProsesPengolahanFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ProsesPengolahanFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (ProsesPengolahanFormState
              is ErrorProsesPengolahanFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ProsesPengolahanFormState.message.toString()),
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
              title: "Form Proses Pengolahan",
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
                        SelectboxStasiun(
                          titleName: "Stasiun",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxStasiun,
                        ),
                        SelectboxWaktuPengamatan(
                          titleName: "Waktu Pengamatan",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxWaktuPengamatan,
                        ),
                        SelectboxTenagaPengoperasian(
                          titleName: "Tenaga Kerja Pengoperasian",
                          isTitleName: true,
                          onChangeFunc:
                              onChangeSelectboxTenagaKerjaPengoperasian,
                        ),
                        SelectboxKondisiProses(
                          titleName: "Kondisi Proses",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxKondisiProses,
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
