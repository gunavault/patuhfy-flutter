import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/apel_pagi/apel_pagi_card/apel_pagi_card_cubit.dart';
import 'package:patuhfy/blocs/apel_pagi/apel_pagi_form/apel_pagi_form_cubit.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/auth_user/auth_user_cubit.dart';
import 'package:patuhfy/blocs/connectivity/connectivity_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_hanca/inspeksi_hanca_card/inspeksi_hanca_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_hanca/inspeksi_hanca_form/inspeksi_hanca_form_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_card/inspeksi_tph_card_cubit.dart';
import 'package:patuhfy/blocs/inspeksi_tph/inspeksi_tph_form/inspeksi_tph_form_cubit.dart';
import 'package:patuhfy/blocs/lap_kerusakan/lap_kerusakan_card/lap_kerusakan_card_cubit.dart';
import 'package:patuhfy/blocs/lap_kerusakan/lap_kerusakan_form/lap_kerusakan_form_cubit.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_card/pencurian_tbs_card_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_form/pencurian_tbs_form_cubit.dart';
import 'package:patuhfy/blocs/pencurian_tbs/pencurian_tbs_list/pencurian_tbs_list_cubit.dart';
import 'package:patuhfy/blocs/real_pemeliharaan_jalan/real_pemeliharaan_jalan_card/real_pemeliharaan_jalan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemeliharaan_jalan/real_pemeliharaan_jalan_form/real_pemeliharaan_jalan_form_cubit.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/real_pemupukan/real_pemupukan_form/real_pemupukan_form_cubit.dart';
import 'package:patuhfy/blocs/real_penunasan/real_penunasan_card/real_penyiangan_card_cubit.dart';
import 'package:patuhfy/blocs/real_penunasan/real_penunasan_form/real_penyiangan_form_cubit.dart';
import 'package:patuhfy/blocs/real_penyiangan/real_penyiangan_card/real_penyiangan_card_cubit.dart';
import 'package:patuhfy/blocs/real_penyiangan/real_penyiangan_form/real_penyiangan_form_cubit.dart';
import 'package:patuhfy/blocs/real_restan/real_restan_card/real_pemupukan_card_cubit.dart';
import 'package:patuhfy/blocs/real_restan/real_restan_form/real_restan_form_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_form/rtl_detail_form_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_list/rtl_detail_list_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_detail_update_status_form/rtl_detail_update_status_form_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_list/rtl_list_cubit.dart';
import 'package:patuhfy/blocs/rtl_page/rtl_update_status_form/rtl_update_status_form_cubit.dart';
import 'package:patuhfy/blocs/selectbox_afdeling/selectbox_afdeling_cubit.dart';
import 'package:patuhfy/blocs/selectbox_blok/selectbox_blok_cubit.dart';
import 'package:patuhfy/blocs/selectbox_mandorks/selectbox_mandorks_cubit.dart';
import 'package:patuhfy/blocs/selectbox_pemanen/selectbox_pemanen_cubit.dart';
import 'package:patuhfy/blocs/tasksheet_page_bloc/tasksheet_page_cubit.dart';
import 'package:patuhfy/blocs/type_user/type_user_cubit.dart';
import 'package:patuhfy/configs/routers.dart';
import 'package:patuhfy/data/local/app_database.dart';
import 'package:patuhfy/data/local/local_data_source.dart';
import 'package:patuhfy/data/remote/remote_data_source.dart';
import 'package:patuhfy/models/user_model.dart';
import 'package:patuhfy/pages/main/main_page.dart';
import 'package:patuhfy/utils/common_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CommonColors.transparent, // navigation bar color
    statusBarColor: CommonColors.transparent, // status bar color
  ));
  final database =
      await $FloorAppDatabase.databaseBuilder('patuhfy.db').build();
  final localDataSource = LocalDataSource(
      database.userDao,
      database.afdelingDao,
      database.blokDao,
      database.tApelpagiDao,
      database.tInspeksiHancaDao,
      database.tInspeksiTphDao,
      database.tPencurianTbsDao,
      database.tLapKerusakanDao,
      database.mandorDao,
      database.pemanenDao,
      database.tRealPemupukanDao,
      database.tRealPenyianganDao,
      database.tRealPenunasanDao,
      database.tRealRestanDao,
      database.tRealPemeliharaanJalanDao,
      database.tRealPengendalianHamaDao);
  final UserModel user = await localDataSource.getCurrentUser() ?? UserModel();
  final remoteDataSource = RemoteDataSource();
  DateTime dateToday = DateTime.now();
  String today = dateToday.toString().substring(0, 10);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ConnectivityCubit(
            localDataSource,
            remoteDataSource,
          ),
        ),
        BlocProvider(
            create: (BuildContext context) => PageCubit(localDataSource)),
        BlocProvider(
          create: (BuildContext context) => AuthUserCubit(localDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) => AuthSessionCubit(localDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) => TypeUserCubit(),
        ),
        BlocProvider(
          create: (context) => SelectboxAfdelingCubit(localDataSource),
        ),
        BlocProvider(
          create: (context) => SelectboxBlokCubit(localDataSource),
        ),
        BlocProvider(
          create: (context) => SelectboxMandorCubit(localDataSource),
        ),
        BlocProvider(
          create: (context) => SelectboxPemanenCubit(localDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ApelPagiFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              TasksheetPageCubit(localDataSource, remoteDataSource, today),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ApelPagiCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              InspeksiHancaFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              InspeksiHancaCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              InspeksiTphCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              InspeksiTphFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              PencurianTbsCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              PencurianTbsFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              PencurianTbsListCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              LapKerusakanCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              LapKerusakanFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPemupukanFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPemupukanCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPemeliharaanJalanFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPemeliharaanJalanCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPenyianganFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPenyianganCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPenunasanFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealPenunasanCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealRestanFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RealRestanCardCubit(localDataSource, remoteDataSource)
                ..checkIsAnwered(today.toString()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RtlListCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RtlDetailFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RtlDetailListCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RtlDetailUpdateStatusFormCubit(localDataSource, remoteDataSource),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              RtlUpdateStatusFormCubit(localDataSource, remoteDataSource),
        ),
      ],
      child: MyApp(
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        user: user,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final UserModel user;
  const MyApp(
      {Key? key,
      required this.localDataSource,
      required this.remoteDataSource,
      required this.user})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patuhfy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyRouters.home,
      routes: {
        MyRouters.home: (context) {
          return const MainPage();
        },
      },
    );
  }
}
