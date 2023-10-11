import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/rtl_detail_page.dart';

import 'rtl_detail_page_v2.dart';

class RtlDetailListV2 extends StatelessWidget {
  const RtlDetailListV2({super.key, required this.dataForm});

  final RtlListModel dataForm;

  @override
  Widget build(BuildContext context) {
    return RtlDetailPageV2(dataRtl: dataForm);
  }
}
