import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/apel_pagi_form/apel_pagi_form_cubit.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/category_list.dart';
import 'package:patuhfy/pages/forms/widget_form/description.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling.dart';
import 'package:patuhfy/pages/forms/widget_form/time_picker.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto_field.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';
import 'package:patuhfy/widgets/textform_field/textform_field_view.dart';

import '../widget_form/date_picker_widget.dart';

class FormApelPagi extends StatelessWidget {
  FormApelPagi({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController imageNameController = TextEditingController();
    TextEditingController kodeAfdelingController = TextEditingController();
    // File pickedImage;
    String? pickedImageBase64Image;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<ApelPagiFormCubit>().submitToDatabase(
            ApelPagiFormModel(
                afd: kodeAfdelingController.text,
                foto: imageNameController.text),
          );

      // _loginBloc.add(LoginPressed(_loginData));
    }

    void _submit() {
      final form = _formKey.currentState;

      print('nama afdeling ini${kodeAfdelingController.text}');
      print('imageNameController  ini${imageNameController.text}');
      print('nama pickedImageBase64Image i${pickedImageBase64Image}');
      if (form!.validate()) {
        form.save();
        _postToDatabase();
      } else {
        // setState(() => _autovalidate = true);
      }
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: Scaffold(
        backgroundColor: CommonColors.whiteColor,
        appBar: AppBarView(
          title: "Form Apel Pagi",
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
                    SelectboxAfdeling(
                      titleName: "Afdeling",
                      isTitleName: true,
                      kodeAfdelingController: kodeAfdelingController,
                    ),
                    UploadFoto(
                      fieldName: 'Evidence Apel Pagi',
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
    );
  }
}
