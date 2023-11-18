import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/blocs/auth_user/auth_user_cubit.dart';
import 'package:patuhfy/blocs/page/page_cubit.dart';
import 'package:patuhfy/blocs/type_user/type_user_cubit.dart';
import 'package:patuhfy/configs/styles.dart';
import 'package:patuhfy/models/form_login_model.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/widgets/button.dart';
import 'package:patuhfy/widgets/constant.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nikSapController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void _login() {
      FocusScope.of(context).requestFocus(FocusNode());
      context.read<AuthUserCubit>().submitFormLogin(
            FormLoginModel(
              nikSapController.text,
              passwordController.text,
            ),
          );
    }

    void _submit() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        _login();
      } else {
        // setState(() => _autovalidate = true);
      }
    }

    return Form(
      key: formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoaderOverlay(
          child: Stack(
            children: [
              MultiBlocListener(
                  listeners: [
                    BlocListener<AuthUserCubit, AuthUserState>(
                      listener: (context, authUserState) {
                        print('apa ini state $authUserState');
                        if (authUserState is AuthUserLoadingState) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 20),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Logging In...'),
                                    CircularProgressIndicator(),
                                  ],
                                ),
                              ),
                            );
                        } else if (authUserState is AuthUserSuccessState) {
                          context.read<PageCubit>().setLoginPage();

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                // duration: Duration(seconds: 4),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Menggambil Data..'),
                                    CircularProgressIndicator(),
                                  ],
                                ),
                                backgroundColor: CommonColors.containerTextB,
                              ),
                            );
                          context.loaderOverlay.hide();

                          context
                              .read<TypeUserCubit>()
                              .setTypeUser(authUserState.typeUserState);

                          // disini set lagi
                        } else if (authUserState is AuthUserErrorState) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              const SnackBar(
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Username / Password Salah'),
                                    Icon(Icons.error)
                                  ],
                                ),
                                backgroundColor: primaryColor,
                              ),
                            );
                        } else if (authUserState is AuthUserNotActiveState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(authUserState.message.toString()),
                                  const Icon(Icons.error)
                                ],
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: ListView(
                      shrinkWrap: false,
                      children: [
                        Container(
                          height: 70,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Hi Planters, Silahkan Login',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            DottedBorder(
                              dashPattern: const [8, 4],
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(16),
                              color: kSubTitleColor.withOpacity(0.2),
                              child: SizedBox(
                                height: 103,
                                width: 500,
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: const Color(0xFFE7EDFF),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Patuhfy App',
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                        style: kTextStyle.copyWith(
                                          color: kSecondaryColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'Hal baik dimulai dengan Halaman Login!',
                                        style: kTextStyle.copyWith(
                                            color: kSubTitleColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: nikSapController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'NIK SAP tidak boleh kosong';
                                }
                                return null;
                              },
                              autocorrect: false,
                              // autofocus: true,
                              keyboardType: TextInputType.name,
                              cursorColor: kTitleColor,
                              textInputAction: TextInputAction.next,
                              decoration: kInputDecoration.copyWith(
                                  contentPadding: const EdgeInsets.only(
                                      left: 7.0, right: 7.0),
                                  fillColor: Colors.transparent,
                                  labelText: 'NIK SAP',
                                  labelStyle: kTextStyle.copyWith(
                                      color: kSubTitleColor),
                                  hintText: 'NIK SAP Aghris',
                                  hintStyle:
                                      kTextStyle.copyWith(color: kTitleColor),
                                  focusColor: kTitleColor,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(IconlyLight.profile,
                                      color: kSubTitleColor)),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              cursorColor: kTitleColor,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              decoration: kInputDecoration.copyWith(
                                contentPadding: const EdgeInsets.only(
                                    left: 7.0, right: 7.0),
                                fillColor: Colors.transparent,
                                labelText: 'Password',
                                labelStyle:
                                    kTextStyle.copyWith(color: kSubTitleColor),
                                hintText: 'password',
                                hintStyle:
                                    kTextStyle.copyWith(color: kTitleColor),
                                focusColor: kTitleColor,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(IconlyLight.lock,
                                    color: kSubTitleColor),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      false
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: kBorderColorTextField),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: kTextStyle.copyWith(
                                        color: kSecondaryColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GlobalButton(
                              width: 350,
                              onPressed: _submit,
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
