import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:patuhfy/blocs/apel_pagi/apel_pagi_card/apel_pagi_card_cubit.dart';
import 'package:patuhfy/blocs/cek_monitoring_ipal/cek_sampel_losis_card/cek_monitoring_ipal_card_cubit.dart';
import 'package:patuhfy/blocs/cek_rutin_sortasi/cek_rutin_sortasi_card/cek_rutin_sortasi_card_cubit.dart';
import 'package:patuhfy/blocs/cek_sampel_losis/cek_sampel_losis_card/cek_sampel_losis_card_cubit.dart';
import 'package:patuhfy/blocs/estetika_pabrik/estetika_pabrik_card/estetika_pabrik_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_hanca/inspeksi_hanca_card/inspeksi_hanca_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_card/inspeksi_tph_card_cubit.dart';
import 'package:patuhfy/blocs/proses_pengolahan/proses_pengolahan_card/proses_pengolahan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemeliharaan_jalan/real_pemeliharaan_jalan_card/real_pemeliharaan_jalan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pengendalian_hama/real_pengendalian_hama_card/real_pengendalian_hama_card_cubit.dart';
import 'package:patuhfy/blocs/real_penunasan/real_penunasan_card/real_penunasan_card_cubit.dart';
import 'package:patuhfy/blocs/real_penyiangan/real_penyiangan_card/real_penyiangan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pusingan_panen/real_pusingan_panen_card/real_pusingan_panen_card_cubit.dart';
import 'package:patuhfy/blocs/real_restan/real_restan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/tasksheet_page_bloc/tasksheet_page_cubit.dart';
import 'package:patuhfy/widgets/constant.dart';

class PilihTanggalTaskSheetWidget extends StatelessWidget {
  PilihTanggalTaskSheetWidget({super.key, required this.selectedDate});

  DateTime selectedDate;

  int calculateWeekOfMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);

    int differenceInDays = date.difference(firstDayOfMonth).inDays;

    int weekOfMonth = (differenceInDays / 7).ceil();

    return weekOfMonth;
  }

  void _onChangeTanggal(context) {
    BlocProvider.of<TasksheetPageCubit>(context)
        .setDatePage(selectedDate.toString().substring(0, 10));

    BlocProvider.of<ApelPagiCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));

    BlocProvider.of<InspeksiHancaCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));

    BlocProvider.of<InspeksiTphCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));

    // BlocProvider.of<PencurianTbsCardCubit>(context)
    //     .checkIsAnwered(selectedDate.toString().substring(0, 10));

    BlocProvider.of<RealPemupukanCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<RealPenyianganCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<RealPenunasanCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<RealRestanCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<RealPemeliharaanJalanCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<RealPengendalianHamaCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<RealPusinganPanenCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));

    // pengolahan

    BlocProvider.of<ProsesPengolahanCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<EstetikaPabrikCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<CekSampelLosisCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<CekMonitoringIpalCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));
    BlocProvider.of<CekRutinSortasiCardCubit>(context)
        .checkIsAnwered(selectedDate.toString().substring(0, 10));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    int weekOfMonth = calculateWeekOfMonth(selectedDate);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, setNewState) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(DateFormat.yMMMd().format(selectedDate)),
                        DatePickerWidget(
                          looping: false,
                          // default is not looping
                          firstDate: DateTime(1990, 01, 01),
                          lastDate: DateTime(2030, 1, 1),
                          initialDate: selectedDate,
                          locale: DatePicker.localeFromString('en'),
                          onChange: (DateTime newDate, _) {
                            setNewState(() {
                              selectedDate = newDate;
                            });
                          },
                          pickerTheme: const DateTimePickerTheme(
                            itemTextStyle:
                                TextStyle(color: Colors.black, fontSize: 19),
                            dividerColor: Colors.transparent,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Batal',
                                style: kTextStyle.copyWith(
                                  color: const Color(0xFFFF5946),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              height: 30.0,
                              width: 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: kBorderColorTextField),
                            ),
                            const SizedBox(width: 10.0),
                            TextButton(
                              onPressed: () {
                                _onChangeTanggal(context);
                              },
                              child: Text(
                                'Pilih',
                                style: kTextStyle.copyWith(
                                  color: kBlueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: kPrimaryGradiant),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhite.withOpacity(0.1),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowLeft2,
                      color: kWhite,
                      size: 18,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                DateFormat.yMMMd().format(selectedDate),
                style: kTextStyle.copyWith(
                    color: kWhite, fontWeight: FontWeight.bold),
              ),
              Text(
                ', Minggu ke - $weekOfMonth ',
                style: kTextStyle.copyWith(
                    color: kWhite, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kWhite.withOpacity(0.1),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.arrowRight2,
                      color: kWhite,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
