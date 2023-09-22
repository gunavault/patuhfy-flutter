// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:patuhfy/blocs/auth_user/auth_user_cubit.dart';
// import 'package:patuhfy/blocs/page/page_cubit.dart';
// import 'package:patuhfy/blocs/type_user/type_user_cubit.dart';
// import 'package:patuhfy/configs/styles.dart';
// import 'package:patuhfy/models/form_login_model.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController userNameController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     final _formKey = GlobalKey<FormState>();
//     final _scaffoldKey = GlobalKey<ScaffoldState>();
//     final GlobalKey<FormFieldState<String>> _passwordKey =
//         GlobalKey<FormFieldState<String>>();
//     final GlobalKey<FormFieldState<String>> _userIdKey =
//         GlobalKey<FormFieldState<String>>();


//     void _login() {
//       FocusScope.of(context).requestFocus(FocusNode());
//       print(userNameController.text);
//       print(passwordController.text);
//       context.read<AuthUserCubit>().submitFormLogin(
//             FormLoginModel(
//               userNameController.text,
//               passwordController.text,
//             ),
//           );

//       // _loginBloc.add(LoginPressed(_loginData));
//     }

//     void _submit() {
//       final form = _formKey.currentState;
//       if (form!.validate()) {
//         form.save();
//         _login();
//       } else {
//         // setState(() => _autovalidate = true);
//       }
//     }

//     return Form(
//       key: _formKey,
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: LoaderOverlay(
//           child: Stack(
//             children: [
//               Image.asset(
//                 "assets/images/bg_login.png",
//                 fit: BoxFit.cover,
//                 height: double.infinity,
//                 width: double.infinity,
//               ),
//               MultiBlocListener(
//                   listeners: [
//                     BlocListener<AuthUserCubit, AuthUserState>(
//                       listener: (context, authUserState) {
//                         print('state auth ${authUserState}');
//                         if (authUserState is AuthUserLoadingState) {
//                           print('ke sini');
//                           ScaffoldMessenger.of(context)
//                             ..hideCurrentSnackBar()
//                             ..showSnackBar(
//                               SnackBar(
//                                 // duration: Duration(seconds: 1),
//                                 content: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text('Logging In...'),
//                                     CircularProgressIndicator(),
//                                   ],
//                                 ),
//                               ),
//                             );
//                         } else if (authUserState is AuthUserSuccessState) {
//                           context
//                               .read<TypeUserCubit>()
//                               .setTypeUser(authUserState.typeUserState);
//                           context.loaderOverlay.hide();

//                           // disini set lagi

//                           context.read<PageCubit>().setLoginPage();
//                           context.loaderOverlay.hide();
//                         } else if (authUserState is AuthUserErrorState) {
//                           ScaffoldMessenger.of(context)
//                             ..hideCurrentSnackBar()
//                             ..showSnackBar(
//                               SnackBar(
//                                 content: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text('Username / Password Salah'),
//                                     Icon(Icons.error)
//                                   ],
//                                 ),
//                                 backgroundColor: primaryColor,
//                               ),
//                             );
//                         } else if (authUserState is AuthUserNotActiveState) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(authUserState.message.toString()),
//                                   Icon(Icons.error)
//                                 ],
//                               ),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ],
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     child: ListView(
//                       shrinkWrap: false,
//                       children: [
//                         Container(
//                           height: 50,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset("assets/images/logo1.png", width: 350),
//                             Text(
//                               "Selamat Datang\nSilahkan login untuk melanjutkan",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.raleway(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 50,
//                             ),
//                             Container(
//                               height: 53.5,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15.0)),
//                                 border: Border.all(
//                                   // color: colorStyle.primaryColor,
//                                   width: 0.15,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 12.0, right: 12.0, top: 5.0),
//                                 child: Theme(
//                                   data:
//                                       ThemeData(hintColor: Colors.transparent),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: TextFormField(
//                                       controller: userNameController,
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return 'Username tidak boleh kosong';
//                                         }
//                                         return null;
//                                       },
//                                       style: new TextStyle(color: Colors.black),
//                                       textAlign: TextAlign.start,
//                                       keyboardType: TextInputType.emailAddress,
//                                       autocorrect: false,
//                                       autofocus: true,
//                                       decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           icon: Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 10.0),
//                                             child: Icon(
//                                               Icons.person,
//                                               // color: colorStyle.primaryColor,
//                                               size: 20,
//                                             ),
//                                           ),
//                                           contentPadding: EdgeInsets.all(0.0),
//                                           filled: true,
//                                           fillColor: Colors.transparent,
//                                           labelText: 'Username',
//                                           hintStyle:
//                                               TextStyle(color: Colors.grey),
//                                           labelStyle: TextStyle(
//                                             color: Colors.grey,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             Container(
//                               height: 53.5,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 //              color: Color(0xFF282E41),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15.0)),
//                                 border: Border.all(
//                                   // color: colorStyle.primaryColor,
//                                   width: 0.15,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 12.0, right: 12.0, top: 5.0),
//                                 child: Theme(
//                                   data:
//                                       ThemeData(hintColor: Colors.transparent),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 10.0),
//                                     child: TextFormField(
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return 'Password tidak boleh kosong';
//                                         }
//                                         return null;
//                                       },
//                                       controller: passwordController,
//                                       // key: _passwordKey,
//                                       // onSaved: (value) => _loginData.password = value,
//                                       style: new TextStyle(color: Colors.black),
//                                       textAlign: TextAlign.start,
//                                       keyboardType: TextInputType.emailAddress,
//                                       autocorrect: false,
//                                       obscureText: true,
//                                       autofocus: true,
//                                       decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           icon: Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 10.0),
//                                             child: Icon(
//                                               Icons.vpn_key,
//                                               size: 20,
//                                               // color: colorStyle.primaryColor,
//                                             ),
//                                           ),
//                                           contentPadding: EdgeInsets.all(0.0),
//                                           filled: true,
//                                           fillColor: Colors.transparent,
//                                           labelText: 'Password',
//                                           hintStyle:
//                                               TextStyle(color: Colors.grey),
//                                           labelStyle: TextStyle(
//                                             color: Colors.grey,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                   style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                             primaryColor),
//                                     shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                     ),
//                                   ),
//                                   child: const Text(
//                                     "LOGIN",
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   onPressed: _submit
//                                   //  () {
//                                   //   context.read<AuthUserCubit>().submitFormLogin(
//                                   //         FormLoginModel(
//                                   //           userNameController.text,
//                                   //           passwordController.text,
//                                   //         ),
//                                   //       );
//                                   // },
//                                   ),
//                             ),
//                             const SizedBox(
//                               height: 25,
//                             ),
//                             Container(
//                               width: double.infinity,
//                               height: 2,
//                               color: secondaryColor,
//                             ),
//                             TextButton(
//                               child: const Text(
//                                 "Lupa Password ?",
//                               ),
//                               onPressed: () {},
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class BodyLogin extends StatelessWidget {
// //   const BodyLogin({
// //     Key? key,
// //     required this.userNameController,
// //     required this.passwordController,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }
// // }
