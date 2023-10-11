import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_update_status_form/rtl_update_status_form_cubit.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

import 'rtl_detail_page_v2.dart';

class RtlDetailListV2 extends StatelessWidget {
  const RtlDetailListV2(
      {super.key, required this.dataForm, required this.userModel});

  final RtlListModel dataForm;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RtlUpdateStatusFormCubit>(context).resetStatus();
    return RtlDetailPageV2(
      dataRtl: dataForm,
      userModel: userModel,
    );
  }
}
