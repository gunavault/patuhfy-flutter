import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/pelaporan_kerusakan_alat/pelaporan_kerusakan_alat_form/pelaporan_kerusakan_alat_form_cubit.dart';
import 'package:patuhfy/blocs/pelaporan_kerusakan_alat/pelaporan_kerusakan_alat_list/pelaporan_kerusakan_alat_list_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
import 'package:patuhfy/blocs/selectbox_alat_by_stasiun/selectbox_alat_by_stasiun_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_alat_by_stasiun.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_kondisi_pks.dart';
import 'package:patuhfy/pages/forms_pengolahan/widget_form/selectbox_stasiun.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormPelaporanKerusakanAlat extends StatelessWidget {
  FormPelaporanKerusakanAlat({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  // final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController imageNameController = TextEditingController();
    TextEditingController kodeStasiunController = TextEditingController();
    TextEditingController alatController = TextEditingController();
    TextEditingController kondisiPksController = TextEditingController();
    TextEditingController keteranganController = TextEditingController();

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<PelaporanKerusakanAlatFormCubit>().submitToDatabase(
            PelaporanKerusakanAlatFormModel(
                stasiun: kodeStasiunController.text,
                alat: alatController.text,
                kondisiPks: kondisiPksController.text,
                keterangan: keteranganController.text,
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
      print('kodeStasiyun $value');
      kodeStasiunController.text = value!.toString();
      BlocProvider.of<SelectboxAlatByStasiunCubit>(context)
          .setParam(value!.toString());
    }

    void onChangeSelectboxAlat(value) {
      alatController.text = value!.toString();
    }

    void onChangeSelectboxKondisiPks(value) {
      kondisiPksController.text = value!.toString();
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<PelaporanKerusakanAlatFormCubit,
          PelaporanKerusakanAlatFormState>(
        listener: (context, PelaporanKerusakanAlatFormState) {
          if (PelaporanKerusakanAlatFormState
              is LoadingPelaporanKerusakanAlatFormState) {
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
          } else if (PelaporanKerusakanAlatFormState
              is SuccessPelaporanKerusakanAlatFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(
                context, PelaporanKerusakanAlatFormState.message, () {
              BlocProvider.of<PelaporanKerusakanAlatListCubit>(context).getData('OPEN');
              Navigator.pop(context);
            });
          } else if (PelaporanKerusakanAlatFormState
              is DuplicatedPelaporanKerusakanAlatFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(PelaporanKerusakanAlatFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (PelaporanKerusakanAlatFormState
              is ErrorPelaporanKerusakanAlatFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(PelaporanKerusakanAlatFormState.message.toString()),
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
              title: "Form Pelaporan Kerusakan Alat",
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
                        SelectboxAlatByStasiun(
                          titleName: "Alat",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxAlat,
                        ),
                        SelectboxKondisiPks(
                          titleName: "Kondisi PKS",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxKondisiPks,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Keterangan',
                          fieldKeterangan: 'Keterangan',
                          fieldType: 'text',
                          fieldController: keteranganController,
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
