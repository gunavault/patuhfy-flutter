import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/auth_user/auth_user_cubit.dart';
import 'package:patuhfy/blocs/connectivity/connectivity_cubit.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/blocs/tabs/tab_cubit.dart';
import 'package:patuhfy/blocs/type_user/type_user_cubit.dart';
import 'package:patuhfy/pages/home/home_page_v2.dart';
import 'package:patuhfy/pages/lapor/lapor_page.dart';
import 'package:patuhfy/pages/login/login_page.dart';
import 'package:patuhfy/pages/login/login_page3.dart';
import 'package:patuhfy/pages/onboarding/on_boarding_page.dart';
import 'package:patuhfy/pages/onboarding/onboard.dart';
import 'package:patuhfy/pages/splash/splash_page.dart';
import 'package:patuhfy/widgets/connectivity.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ConnectivityCubit>().initConnectivity();
    return MultiBlocListener(
        listeners: [
          BlocListener<PageCubit, PageState>(
            listener: (context, state) {
              if (state is HomePageState) {
                // context.read<AuthUserCubit>().getCurrentUser();
                context.read<AuthSessionCubit>().getUser();
              }
            },
          ),
          BlocListener<AuthUserCubit, AuthUserState>(
            listener: (context, state) {
              if (state is AuthUserSuccessState) {
                print('kesini gan bos');
                // context.read<TypeUserCubit>().setTypeUser(state.typeUserState);
                // context.read<AuthSessionCubit>().getUser();
                print('kesini gan bos 2');
              }
            },
          ),
        ],
        child: ConnectivityWidget(child: BlocBuilder<PageCubit, PageState>(
          builder: (context, pageState) {
            print('pageState ${pageState}');
            if (pageState is OnBoardingPageState) {
              return OnBoardingPage();
            } else if (pageState is LoginPageState) {
              return LoginPage();
            } else if (pageState is HomePageState) {
              // return LaporPage();
              return BlocProvider(
                create: (BuildContext context) => TabCubit(),
                child: HomePageV2(),
              );
            } else {
              return SplashPage();
            }
          },
        )));
  }
}
