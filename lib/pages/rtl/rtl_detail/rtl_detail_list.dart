import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/network/disconnected.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/rtl_detail_page.dart';

import 'widget/rtl_detail_no_data.dart';

class RtlDetailList extends StatelessWidget {
  const RtlDetailList({super.key, required this.dataForm});

  final RtlListModel dataForm;

  void _getData(context) {
    BlocProvider.of<RtlDetailListCubit>(context).getData(dataForm);
  }

  @override
  Widget build(BuildContext context) {
    _getData(context);
    return BlocBuilder<RtlDetailListCubit, RtlDetailListState>(
      builder: (context, state) {
        if (state is LoadingRtlDetailListListState) {
          return const Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Center(child: CircularProgressIndicator())],
            ),
          );
        }

        if (state is NoDataRtlDetailListListState) {
          return RtlDetailNoData(
            dataRtl: state.dataFormRtl,
          );
        }

        if (state is SuccessRtlDetailListListState) {
          return RtlDetailPage(
            dataRtl: state.dataFormRtl,
            dataRtlDetail: state.dataFormRtlDetail,
          );
        }

        return const Disconnected();
      },
    );
  }
}
