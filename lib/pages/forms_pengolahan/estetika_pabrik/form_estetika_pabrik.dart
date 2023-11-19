import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_form/estetika_pabrik_form_cubit.dart';
import 'package:patuhfy/blocs/performa_list/performa_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/estetika_pabrik_model.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_jenis_kebersihan.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_waktu_pengamatan.dart';
import 'package:patuhfy/pages/forms/widget_form/upload_foto.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';
import 'package:patuhfy/widgets/custom_button/custom_buttons.dart';
import 'package:patuhfy/pages/forms/widget_form/selectbox_stasiun.dart';

class FormEstetikaPabrik extends StatelessWidget {
  FormEstetikaPabrik({Key? key, required this.selectedDate}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String selectedDate;
  @override
  Widget build(BuildContext context) {
    TextEditingController imageNameController = TextEditingController();
    TextEditingController kodeStasiunController = TextEditingController();
    TextEditingController kodeWaktuPengamatanController =
        TextEditingController();
    TextEditingController kodeJenisKebersihanController =
        TextEditingController();
    // File pickedImage;
    String? pickedImageBase64Image;

    void _postToDatabase() {
      FocusScope.of(context).requestFocus(FocusNode());

      context.read<EstetikaPabrikFormCubit>().submitToDatabase(
            EstetikaPabrikFormModel(
                stasiun: kodeStasiunController.text,
                waktuPengamatan: kodeWaktuPengamatanController.text,
                jenisKebersihan: kodeJenisKebersihanController.text,
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

    void onChangeSelectboxJenisKebersihan(value) {
      kodeJenisKebersihanController.text = value!.toString();
    }

    return GestureDetector(
      onTap: () {
        CommonMethods.hideKeyboard();
      },
      child: BlocListener<EstetikaPabrikFormCubit, EstetikaPabrikFormState>(
        listener: (context, EstetikaPabrikFormState) {
          if (EstetikaPabrikFormState is LoadingEstetikaPabrikFormState) {
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
          } else if (EstetikaPabrikFormState
              is SuccessEstetikaPabrikFormState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showAlertSuccessOkActionV2(context, EstetikaPabrikFormState.message,
                () {
              // BlocProvider.of<EstetikaPabrikCardCubit>(context)
              //     .checkIsAnwered(selectedDate);
              BlocProvider.of<PerformaCubit>(context).getData();

              Navigator.pop(context);
            });
          } else if (EstetikaPabrikFormState
              is DuplicatedEstetikaPabrikFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(EstetikaPabrikFormState.message),
                      const Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: primaryColor,
                ),
              );
          } else if (EstetikaPabrikFormState is ErrorEstetikaPabrikFormState) {
            context.loaderOverlay.hide();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(EstetikaPabrikFormState.message.toString()),
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
              title: "Form Estetika Pabrik",
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
                        SelectboxJenisKebersihan(
                          titleName: "Jenis Kebersihan",
                          isTitleName: true,
                          onChangeFunc: onChangeSelectboxJenisKebersihan,
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
