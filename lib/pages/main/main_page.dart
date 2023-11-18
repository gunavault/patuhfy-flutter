import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patuhfy/blocs/auth_session/auth_session_cubit.dart';
import 'package:patuhfy/blocs/connectivity/connectivity_cubit.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/blocs/tabs/tab_cubit.dart';
import 'package:patuhfy/pages/home/home_page_v2.dart';
import 'package:patuhfy/pages/login/login_page.dart';
import 'package:patuhfy/pages/network/has_update.dart';
import 'package:patuhfy/pages/onboarding/onboard.dart';
import 'package:patuhfy/pages/splash/splash_page.dart';

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
                context.read<AuthSessionCubit>().getUser();
              }
            },
          ),
        ],
        child: BlocBuilder<PageCubit, PageState>(
          builder: (context, pageState) {
            if (pageState is OnBoardingPageState) {
              return const OnBoardingPage();
            } else if (pageState is LoginPageState) {
              return const LoginPage();
            } else if (pageState is HomePageState) {
              return BlocProvider(
                create: (BuildContext context) => TabCubit(),
                child: HomePageV2(
                  userModel: pageState.userModel,
                ),
              );
            } else if (pageState is HasNewUpdate) {
              return HasUpdateAppPage();
            } else {
              return const SplashPage();
            }
          },
        ));
  }
}
