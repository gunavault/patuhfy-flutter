import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/apel_pagi_card/apel_pagi_card_cubit.dart';
import 'package:patuhfy/blocs/apel_pagi_form/apel_pagi_form_cubit.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/auth_user/auth_user_cubit.dart';
import 'package:patuhfy/blocs/connectivity/connectivity_cubit.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/blocs/selectbox_afdeling/selectbox_afdeling_cubit.dart';
import 'package:patuhfy/blocs/tabs/tab_cubit.dart';
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
  final localDataSource = LocalDataSource(database.userDao,
      database.afdelingDao, database.blokDao, database.tApelpagiDao);
  final UserModel user =
      await localDataSource.getCurrentUser() ?? UserModel(company_code: '');
  final remoteDataSource = RemoteDataSource();
  DateTime dateToday = new DateTime.now();
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
          return MainPage();
        },
      },
    );
  }
}
