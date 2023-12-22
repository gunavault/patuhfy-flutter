import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_update_status_form/rtl_update_status_form_cubit.dart';
import 'package:patuhfy/models/pelaporan_kerusakan_alat_form_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/models/user_model.dart';

import 'analisa_kerusakan_alat_page_v2.dart';

class AnalisaKerusakanAlatListV2 extends StatelessWidget {
  const AnalisaKerusakanAlatListV2(
      {super.key, required this.dataForm, required this.userModel});

  final PelaporanKerusakanAlatFormModel dataForm;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return AnalisaKerusakanAlatPageV2(
      dataPelaporanKerusakanAlat: dataForm,
      userModel: userModel,
    );
  }
}
