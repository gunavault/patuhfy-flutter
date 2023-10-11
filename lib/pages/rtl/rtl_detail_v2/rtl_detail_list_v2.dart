import 'package:flutter/material.dart';
import 'package:patuhfy/models/rtl_list_model.dart';

import 'rtl_detail_page_v2.dart';

class RtlDetailListV2 extends StatelessWidget {
  const RtlDetailListV2({super.key, required this.dataForm});

  final RtlListModel dataForm;

  @override
  Widget build(BuildContext context) {
    return RtlDetailPageV2(dataRtl: dataForm);
  }
}
