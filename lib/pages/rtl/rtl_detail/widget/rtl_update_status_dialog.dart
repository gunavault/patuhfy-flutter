import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_update_status_form/rtl_detail_update_status_form_cubit.dart';
import 'package:patuhfy/models/rtl_detail_update_status_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/forms/widget_form/text_form_field.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/widgets/alert_success_ok_action.dart';
import 'package:patuhfy/widgets/constant.dart';

class RtlUpdateStatusDialog extends StatelessWidget {
  final int status;
  final String rowstamp;
  final RtlListModel dataRtl;

  const RtlUpdateStatusDialog(
      {super.key,
      required this.status,
      required this.dataRtl,
      required this.rowstamp});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, status, rowstamp, dataRtl),
    );
  }
}

dialogContent(
    BuildContext context, int status, String rowstamp, RtlListModel dataRtl) {
  TextEditingController keteranganController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _postToDatabase(rowstamp, status) {
    FocusScope.of(context).requestFocus(FocusNode());

    context.read<RtlDetailUpdateStatusFormCubit>().submitToDatabase(
          RtlDetailUpdateStatusFormModel(
            rowstamp: rowstamp,
            status: status.toString(),
            keteranganStatus: keteranganController.text,
          ),
        );
  }

  void submitData(rowstamp, status) {
    // FocusScope.of(context).requestFocus(FocusNode());
    final form = _formKey.currentState;

    if (form!.validate()) {
      // context.loaderOverlay.show();
      // Navigator.pop(context);
      form.save();
      _postToDatabase(rowstamp, status);
    }
  }

  _onSuccessSubmit(RtlListModel dataRtl) {
    // Navigator.pop(context);
    BlocProvider.of<RtlDetailListCubit>(context).getData(dataRtl);
    // showAlertSuccessOkActionV2(context, 'Status RTL berhasil diubah.', () {
    //   BlocProvider.of<RtlDetailListCubit>(context).getData(dataRtl);
    //   Navigator.pop(context);
    // });
  }

  // var width = context.width();
  return BlocListener<RtlDetailUpdateStatusFormCubit,
      RtlDetailUpdateStatusFormState>(
    listener: (ctx, state) {
      // TODO: implement listener

      if (state is SuccessRtlDetailUpdateStatusFormState) {
        // ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
        Navigator.pop(context);
        ScaffoldMessenger.of(ctx)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 1),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Status RTL Berhasil diubah.'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        // Timer.periodic(Duration(seconds: 2), (timer) {
        //   print('aaa');
        _onSuccessSubmit(dataRtl);
        // });
      } else if (state is LoadingRtlDetailUpdateStatusFormState) {
        print('ke sini');
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              // duration: Duration(seconds: 4),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mengirim Data...'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
      }
    },
    child: Container(
      decoration: BoxDecoration(
        color: CommonColors.background,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 0.0),
          )
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: BlocBuilder<RtlDetailUpdateStatusFormCubit,
          RtlDetailUpdateStatusFormState>(
        builder: (contextForm, state) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max, // To make the card compact
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        status == 1
                            ? 'Form Selesaikan RTL'
                            : 'Form Batalkan RTL',
                        style: kTextStyle.copyWith(
                            fontSize: 17,
                            color: kTitleColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          FeatherIcons.x,
                          color: kSubTitleColor,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 10.0),
                  TextFormFieldWidgetForm(
                    fieldController: keteranganController,
                    fieldKeterangan: 'Keterangan',
                    fieldText: 'Keterangan',
                    fieldType: 'text',
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                    ),
                    onPressed: () {
                      if (state is LoadingRtlDetailUpdateStatusFormState) {
                      } else {
                        submitData(rowstamp, status);
                      }
                    },
                    child: Container(
                      decoration: (state
                              is LoadingRtlDetailUpdateStatusFormState)
                          ? BoxDecoration(
                              gradient: const LinearGradient(colors: <Color>[
                                Color.fromARGB(255, 180, 183, 183),
                                Color.fromARGB(255, 123, 127, 125)
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            )
                          : BoxDecoration(
                              gradient: status == 1
                                  ? const LinearGradient(colors: <Color>[
                                      Color.fromARGB(255, 9, 139, 124),
                                      Color.fromARGB(255, 10, 189, 84)
                                    ])
                                  : const LinearGradient(colors: <Color>[
                                      Color.fromARGB(255, 252, 44, 44),
                                      Color.fromARGB(255, 249, 117, 117)
                                    ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: Text(
                              (state is LoadingRtlDetailUpdateStatusFormState)
                                  ? 'Mengrim..'
                                  : 'Submit',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
