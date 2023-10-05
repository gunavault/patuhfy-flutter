import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_card/inspeksi_tph_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_form/inspeksi_tph_form_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_card/pencurian_tbs_card_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_form/pencurian_tbs_form_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_list/pencurian_tbs_list_cubit.dart';
import 'package:patuhfy/blocs/selectbox_blok/selectbox_blok_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_blok.dart';
import 'package:patuhfy/models/inspeksi_tph_form_model.dart';
import 'package:patuhfy/models/pencurian_tbs_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class FormPencurianTbs extends StatelessWidget {
  FormPencurianTbs({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController kodeAfdelingController = TextEditingController();
    TextEditingController kodeBlokController = TextEditingController();
    TextEditingController tahunTanamController = TextEditingController();
    TextEditingController realisasiPencurianTbsTandanController =
        TextEditingController();
    TextEditingController realisasiPencurianTbsKgController =
        TextEditingController();
    TextEditingController rtlController = TextEditingController();
    TextEditingController fotoController = TextEditingController();
    TextEditingController brondolanController = TextEditingController();

    // File pickedImage;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<PencurianTbsFormCubit>().submitToDatabase(
            PencurianTbsFormModel(
              afd: kodeAfdelingController.text,
              blok: kodeBlokController.text,
              tahunTanam: int.parse(tahunTanamController.text),
              realisasiPencurianTbsTandan:
                  int.parse(realisasiPencurianTbsTandanController.text),
              realisasiPencurianTbsKg:
                  int.parse(realisasiPencurianTbsKgController.text),
              brondolan:
                  int.parse(brondolanController.text),
              rtl: rtlController.text,
              foto: fotoController.text,
            ),
          );

      // _loginBloc.add(LoginPressed(_loginData));
    }

    void _updateBLocAfterSuccess() {
      BlocProvider.of<PencurianTbsCardCubit>(context)
          .checkIsAnwered(selectedDate);

      BlocProvider.of<PencurianTbsListCubit>(context).getData(selectedDate);
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

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<PencurianTbsFormCubit, PencurianTbsFormState>(
        listener: (context, PencurianTbsFormState) {
          if (PencurianTbsFormState is LoadingPencurianTbsFormState) {
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
          } else if (PencurianTbsFormState is SuccessPencurianTbsFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, PencurianTbsFormState.message,
                () {
              _updateBLocAfterSuccess();
              Navigator.pop(context);
            });
          } else if (PencurianTbsFormState is DuplicatedPencurianTbsFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(PencurianTbsFormState.message),
                      Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (PencurianTbsFormState is ErrorPencurianTbsFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(PencurianTbsFormState.message.toString()),
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
              title: "Form Pencurian TBS",
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
                          fieldText: 'Relisasi Pencurian TBS (Tandan)',
                          fieldKeterangan: 'TBS (Tandan)',
                          fieldType: 'number',
                          fieldController:
                              realisasiPencurianTbsTandanController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Realisasi Pencurian TBS (Kg)',
                          fieldKeterangan: 'TBS (Kg)',
                          fieldType: 'number',
                          fieldController: realisasiPencurianTbsKgController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Brondolan (Kg)',
                          fieldKeterangan: 'Brondolan (Kg)',
                          fieldType: 'number',
                          fieldController: brondolanController,
                        ),
                        TextFormFieldWidgetForm(
                          fieldText: 'Rencana Tindak Lanjut',
                          fieldKeterangan: 'Rencana Tindak Lanjut',
                          fieldType: 'text',
                          fieldController: rtlController,
                        ),
                        UploadFoto(
                          fieldName: 'Evidence Pencurian Tbs',
                          imageNameController: fotoController,
                        ),
                        const SizedBox(height: 20.0),
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
