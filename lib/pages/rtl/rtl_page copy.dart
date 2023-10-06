// import 'package:flutter/material.dart';
// import 'package:patuhfy/widgets/constant.dart';

// class RtlPage extends StatelessWidget {
//   const RtlPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     List aaa = [
//       Center(
//           child: Text(
//         'awww',
//         style: TextStyle(color: Colors.black),
//       )),
//       Center(child: Text('yess')),
//       Center(child: Text('ayes'))
//     ];
//     return Scaffold(
//       backgroundColor: kDarkWhite,
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(gradient: kPrimaryGradiant),
//         ),
//         // backgroundColor: kPrimaryGradiant,
//         elevation: 0.5,
//         centerTitle: true,
//         title: Text(
//           'Rencana Tindak Lanjut',
//           style: kTextStyle.copyWith(
//               color: kDarkWhite, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 26),
//             child: Column(
//               children: [
//                 RadioChips(
//                   values: ['Open', 'Close', 'Rejected'],
//                   onSelected: (index) {
//                     print('selected: $index');
//                     return Text('awww');
//                   },
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RadioChips extends StatefulWidget {
//   final List<String> values;
//   final int initialPosition;
//   final Function(int index) onSelected;

//   RadioChips(
//       {required this.values,
//       required this.onSelected,
//       this.initialPosition = 0});

//   @override
//   _RadioChipsState createState() => _RadioChipsState();
// }

// class _RadioChipsState extends State<RadioChips> {
//   late int current;

//   @override
//   void initState() {
//     super.initState();
//     current = widget.initialPosition;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(
//         widget.values.length,
//         (index) {
//           return GestureDetector(
//             onTap: () async {
//               setState(() => current = index);
//               widget.onSelected(index);
//             },
//             child: Container(
//               height: 30,
//               alignment: Alignment.center,
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 gradient:
//                     index == current ? kPrimaryGradiantNew : kPrimaryGradiantGG,
//                 border: Border.all(color: kGreyColor),
//                 borderRadius: const BorderRadius.all(Radius.circular(18)),
//                 color: index == current ? Color(0xFF00B5E8) : kDarkWhite,
//               ),
//               child: Text(widget.values[index],
//                   style: TextStyle(color: kNeutralColor)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
