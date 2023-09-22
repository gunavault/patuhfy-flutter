// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:patuhfy/blocs/page/page_cubit.dart';

// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // const BaseBackground(),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/images/logo1.png"),
//               const SizedBox(
//                 height: 53,
//               ),
//               SizedBox(
//                 width: 250,
//                 child: ElevatedButton(
//                   child: const Text(
//                     "Mulai",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         const Color(0xFFFFC739)),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     context.read<PageCubit>().setHasOnBoarding();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
