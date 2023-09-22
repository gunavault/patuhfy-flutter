// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';

// import '../expense/expense.dart';
// import '../holiday/holiday.dart';
// import '../profile/profile.dart';
// import '../timesheet/time_sheet.dart';
// import '../widgets/constant.dart';
// import 'home_screen.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int _currentPage = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     TimeSheet(),
//     Expense(),
//     Holiday(),
//     Profile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const HomeScreen(),
//       backgroundColor: const Color(0xFFF7F7F7),
//       body: _widgetOptions.elementAt(_currentPage),
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 2.0,
//         selectedItemColor: kBlueColor,
//         unselectedItemColor: kSubTitleColor,
//         backgroundColor: kWhite,
//         showUnselectedLabels: true,
//         items: const [
//           /// Home
//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.home),
//             label: "Home",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.timeCircle),
//             label: "Timesheet",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.wallet),
//             label: "Expense",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.calendar),
//             label: "Holiday",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.profile),
//             label: "Profile",
//           ),
//         ],
//         onTap: (int index) {
//           setState(() => _currentPage = index);
//         },
//         currentIndex: _currentPage,
//       ),
//     );
//   }
// }
