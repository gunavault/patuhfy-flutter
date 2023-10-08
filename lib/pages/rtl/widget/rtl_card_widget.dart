import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patuhfy/configs/constants.dart';
import 'package:patuhfy/configs/global_styles.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';

class RtlCard extends StatelessWidget {
  const RtlCard({super.key, required this.data, required this.onClickFunction});

  final RtlListModel data;
  final Function onClickFunction;

  String _changeDateForm(RtlListModel dataForm) {
    final dataTanggal = dataForm.mobileCreatedAt.toString();
    final format = DateFormat("yyyy-MM-dd HH:mm:ss");
    final DateTime result = format.parse(dataTanggal);
    print('opo iki $result'); //2022-10-27 11:02:50.000

    final newFormatter = DateFormat("EEEE, MMMM dd, yyyy");
    final newFormatString = newFormatter.format(result);

    return newFormatString;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            onClickFunction();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 06, bottom: 06),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: CommonColors.containerTextB.withOpacity(0.2)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2, top: 12, bottom: 12, right: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              data.deskripsi.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _changeDateForm(data),
                            style: GlobalStyle.textTag,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.local_offer_outlined,
                                  color: Colors.orange, size: 15),
                              const SizedBox(width: 2),
                              Text(data.kategori.toString(),
                                  style: GlobalStyle.textRatingDistances),
                              const SizedBox(width: 6),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                    decoration: BoxDecoration(
                      color: CommonMethods.colorBadge(data.status),
                      boxShadow: const [BoxShadow(color: Colors.transparent)],
                      border: Border.all(color: CommonColors.iconButtonColor),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Text(
                      data.status.toString(),
                      style: const TextStyle(
                          fontSize: 16, color: Color(0XFFFFFFFF)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
