import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/apel_pagi/apel_pagi_card/apel_pagi_card_cubit.dart';
import 'package:patuhfy/blocs/apel_pagi/apel_pagi_form/apel_pagi_form_cubit.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_afdeling_new.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/apel_pagi_form_model.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';

class RtlDetailUpdateStatusForm extends StatefulWidget {
  RtlDetailUpdateStatusForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RtlDetailUpdateStatusForm> createState() =>
      _RtlDetailUpdateStatusFormState();
}

class _RtlDetailUpdateStatusFormState extends State<RtlDetailUpdateStatusForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> options = ['1', '2'];
  TextEditingController keteranganController = TextEditingController();

  String statusController = '';
  @override
  Widget build(BuildContext context) {
    // File pickedImage;
    // @override
    void initState() {
      super.initState();
    }

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      // context.read<ApelPagiFormCubit>().submitToDatabase(
      //       ApelPagiFormModel(
      //           afd: kodeAfdelingController.text,
      //           foto: imageNameController.text),
      //     );

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

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<ApelPagiFormCubit, ApelPagiFormState>(
        listener: (context, apelPagiFormState) {
          if (apelPagiFormState is LoadingApelPagiFormState) {
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
          } else if (apelPagiFormState is SuccessApelPagiFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, apelPagiFormState.message, () {
              // BlocProvider.of<ApelPagiCardCubit>(context)
              //     .checkIsAnwered(selectedDate);
              Navigator.pop(context);
            });
          } else if (apelPagiFormState is DuplicatedApelPagiFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(apelPagiFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (apelPagiFormState is ErrorApelPagiFormState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(apelPagiFormState.message.toString()),
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Radio(
                                value: '1',
                                groupValue: statusController,
                                onChanged: (String? value) {
                                  print('value1232 ${value}');

                                  setState(() {
                                    statusController = value!;
                                    // _val1 = value!;
                                  });
                                },
                              ),
                              Text('DITERIMA'),
                              Radio(
                                value: '2',
                                groupValue: statusController,
                                onChanged: (String? value) {
                                  print('value ${value}');
                                  setState(() {
                                    statusController = value!;
                                  });
                                },
                              ),
                              Text('DITOLAK'),
                            ],
                          ),
                        ),
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
