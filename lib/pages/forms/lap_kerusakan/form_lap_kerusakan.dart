import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/lap_kerusakan/lap_kerusakan_card/lap_kerusakan_card_cubit.dart';
import 'package:patuhfy/blocs/lap_kerusakan/lap_kerusakan_form/lap_kerusakan_form_cubit.dart';

import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/lap_kerusakan_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormLapKerusakan extends StatelessWidget {
  FormLapKerusakan({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController imageNameController = TextEditingController();
    TextEditingController kodeAfdelingController = TextEditingController();
    TextEditingController keteranganKerusakanController = TextEditingController();
    TextEditingController rencanaTindakLanjutController = TextEditingController();
    // File pickedImage;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<LapKerusakanFormCubit>().submitToDatabase(
            LapKerusakanFormModel(
                afd: kodeAfdelingController.text,
                keterangan: keteranganKerusakanController.text,
                rencana_tindaklanjut: rencanaTindakLanjutController.text,
                foto: imageNameController.text),
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
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<LapKerusakanFormCubit, LapKerusakanFormState>(
        listener: (context, LapKerusakanFormState) {
          if (LapKerusakanFormState is LoadingLapKerusakanFormState) {
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
          } else if (LapKerusakanFormState is SuccessLapKerusakanFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, LapKerusakanFormState.message, () {
              BlocProvider.of<LapKerusakanCardCubit>(context)
                  .checkIsAnwered(selectedDate);
              Navigator.pop(context);
            });
          } else if (LapKerusakanFormState is DuplicatedLapKerusakanFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(LapKerusakanFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (LapKerusakanFormState is ErrorLapKerusakanFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LapKerusakanFormState.message.toString()),
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
              title: "Form Laporan Kerusakan",
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
                          fieldText: 'Keterangan',
                          fieldKeterangan: 'Keterangan',
                          fieldType: 'text',
                          fieldController: keteranganKerusakanController,
                        ),
                        
                        TextFormFieldWidgetForm(
                          fieldText: 'Rencana Tindak Lanjut',
                          fieldKeterangan: 'Rencana Tindak Lanjut',
                          fieldType: 'text',
                          fieldController: rencanaTindakLanjutController,
                        ),
                        UploadFoto(
                          fieldName: 'Evidence Laporan Kerusakan',
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
