import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_list/rtl_list_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_update_status_form/rtl_update_status_form_cubit.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/rtl_update_status_model.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class RtlUpdateStatusForm extends StatelessWidget {
  RtlUpdateStatusForm({
    Key? key,
    required this.dataForm,
  }) : super(key: key);

  final RtlListModel dataForm;

  final _formKey = GlobalKey<FormState>();
  TextEditingController keteranganController = TextEditingController();

  String statusController = '';
  @override
  Widget build(BuildContext context) {
    // File pickedImage;
    // @override

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<RtlUpdateStatusFormCubit>().submitToDatabase(
            RtlUpdateStatusFormModel(
                rowstamp: dataForm.rowstamp,
                keteranganStatus: keteranganController.text),
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

    void _onSuccess(message) {
      showAlertSuccessOkActionV2(context, message, () {
        BlocProvider.of<RtlListCubit>(context).getData('OPEN');
        Navigator.pop(context);
      });
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<RtlUpdateStatusFormCubit, RtlUpdateStatusFormState>(
        listener: (context, state) {
          if (state is LoadingRtlUpdateStatusFormState) {
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
          } else if (state is SuccessRtlUpdateStatusFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _onSuccess(state.message);
          } else if (state is DuplicatedRtlUpdateStatusFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(state.message), const Icon(Icons.error)],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (state is ErrorRtlUpdateStatusFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.message.toString()),
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
              title: "Form Update Status RTL  ",
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
                        TextFormFieldWidgetForm(
                          fieldController: keteranganController,
                          fieldKeterangan: 'Keterangan',
                          fieldText: 'Keterangan',
                          fieldType: 'text',
                          maxLines: 3,
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
