// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<ChartSampleData> chartData = <ChartSampleData>[
//     ChartSampleData(
//         x: 'SAT', y: 10, secondSeriesYValue: 17, thirdSeriesYValue: 11),
//     ChartSampleData(
//         x: 'SUN', y: 15, secondSeriesYValue: 17, thirdSeriesYValue: 15),
//     ChartSampleData(
//         x: 'MON', y: 10, secondSeriesYValue: 19, thirdSeriesYValue: 18),
//     ChartSampleData(
//         x: 'TUE', y: 15, secondSeriesYValue: 13, thirdSeriesYValue: 12),
//     ChartSampleData(
//         x: 'WED', y: 13, secondSeriesYValue: 18, thirdSeriesYValue: 17),
//     ChartSampleData(
//         x: 'THU', y: 18, secondSeriesYValue: 14, thirdSeriesYValue: 11),
//     ChartSampleData(
//         x: 'FRI', y: 12, secondSeriesYValue: 17, thirdSeriesYValue: 16),
//   ];

//   final List<ChartData> chartsData = [
//     ChartData('1084', 25, const Color(0xFFFF9494)),
//     ChartData('5448', 38, const Color(0xFFF3D7A0)),
//     ChartData('4800', 34, const Color(0xFF80BAFF)),
//     ChartData('3554', 35, const Color(0xFF91D6AC)),
//     ChartData('8624', 49, const Color(0xFFADABFF)),
//     ChartData('7896', 48, const Color(0xFFFFB580)),
//     ChartData('3645', 40, const Color(0xFFE2A5E8)),
//   ];

//   /// Returns the defaul spline chart.
//   SfCartesianChart _buildDefaultSplineChart() {
//     return SfCartesianChart(
//       borderColor: Colors.transparent,
//       backgroundColor: Colors.transparent,
//       plotAreaBorderWidth: 0,
//       plotAreaBackgroundColor: Colors.transparent,
//       legend: Legend(isVisible: false),
//       primaryXAxis: CategoryAxis(
//           axisBorderType: AxisBorderType.withoutTopAndBottom,
//           maximumLabels: 3,
//           borderColor: Colors.transparent,
//           minorGridLines: const MinorGridLines(color: Colors.transparent),
//           labelStyle: kTextStyle.copyWith(color: kWhite),
//           arrangeByIndex: false,
//           majorGridLines: const MajorGridLines(width: 0),
//           labelPlacement: LabelPlacement.betweenTicks),
//       primaryYAxis: NumericAxis(
//           minimum: 0,
//           maximum: 50,
//           isInversed: false,
//           isVisible: true,
//           maximumLabels: 3,
//           borderColor: Colors.transparent,
//           minorGridLines: const MinorGridLines(color: Colors.transparent),
//           labelStyle: kTextStyle.copyWith(color: kWhite),
//           axisLine: const AxisLine(width: 0),
//           edgeLabelPlacement: EdgeLabelPlacement.none,
//           labelFormat: '{value}',
//           majorTickLines: const MajorTickLines(size: 0)),
//       series: _getDefaultSplineSeries(),
//       tooltipBehavior: TooltipBehavior(enable: false),
//     );
//   }

//   /// Returns the list of chart series which need to render on the spline chart.
//   List<SplineSeries<ChartSampleData, String>> _getDefaultSplineSeries() {
//     return <SplineSeries<ChartSampleData, String>>[
//       SplineSeries<ChartSampleData, String>(
//         color: kWhite,
//         width: 4,
//         dataSource: chartData,
//         xValueMapper: (ChartSampleData sales, _) => sales.x as String,
//         yValueMapper: (ChartSampleData sales, _) => sales.y,
//         markerSettings: const MarkerSettings(isVisible: false),
//         name: 'Amount',
//         isVisibleInLegend: false,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: kDarkWhite,
//         appBar: AppBar(
//           backgroundColor: kDarkWhite,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             'Home',
//             style: kTextStyle.copyWith(
//                 color: kTitleColor, fontWeight: FontWeight.bold),
//           ),
//           leading: Builder(builder: (context) {
//             return IconButton(
//               onPressed: () => Scaffold.of(context).openDrawer(),
//               icon: const Icon(
//                 Icons.sort_rounded,
//                 color: kTitleColor,
//               ),
//             );
//           }),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {});
//               },
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(Icons.add, color: kBlueColor),
//                   Text(
//                     'Add',
//                     style: kTextStyle.copyWith(
//                         color: kBlueColor, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Staff Holiday',
//                   style: kTextStyle.copyWith(
//                       color: kTitleColor, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Container(
//                   padding: const EdgeInsets.all(10.0),
//                   height: 82,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       gradient: kPrimaryGradiant),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '25',
//                             style: kTextStyle.copyWith(
//                                 color: kWhite,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18.0),
//                           ),
//                           Text(
//                             'Allowance',
//                             style: kTextStyle.copyWith(
//                               color: kWhite,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 10.0),
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '12',
//                             style: kTextStyle.copyWith(
//                                 color: kWhite,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18.0),
//                           ),
//                           Text(
//                             'Booked',
//                             style: kTextStyle.copyWith(
//                               color: kWhite,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 10.0),
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '06',
//                             style: kTextStyle.copyWith(
//                                 color: kWhite,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18.0),
//                           ),
//                           Text(
//                             'Pending',
//                             style: kTextStyle.copyWith(
//                               color: kWhite,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 10.0),
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '30',
//                             style: kTextStyle.copyWith(
//                                 color: kWhite,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18.0),
//                           ),
//                           Text(
//                             'Remaining',
//                             style: kTextStyle.copyWith(
//                               color: kWhite,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Container(
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0), color: kWhite),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Curent Week Total',
//                             style: kTextStyle.copyWith(color: kSubTitleColor),
//                           ),
//                           const SizedBox(height: 10.0),
//                           RichText(
//                             text: TextSpan(
//                               text: '22.50',
//                               style: kTextStyle.copyWith(
//                                   color: kBlueColor,
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.bold),
//                               children: [
//                                 TextSpan(
//                                   text: ' /40.00 Hrs',
//                                   style: kTextStyle.copyWith(
//                                       color: kTitleColor,
//                                       fontSize: 18.0,
//                                       fontWeight: FontWeight.bold),
//                                 )
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 10.0),
//                           Text(
//                             '23 Sep 2021',
//                             style: kTextStyle.copyWith(
//                                 color: kSubTitleColor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       const Spacer(),
//                       CircularPercentIndicator(
//                         radius: 45.0,
//                         lineWidth: 8.0,
//                         percent: 0.60,
//                         center: Text(
//                           "22.50h",
//                           style: kTextStyle.copyWith(color: kSubTitleColor),
//                         ),
//                         progressColor: kSecondaryColor,
//                         backgroundColor: kSecondaryColor.withOpacity(0.2),
//                         circularStrokeCap: CircularStrokeCap.round,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Container(
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0), color: kWhite),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '33.33%',
//                                 style: kTextStyle.copyWith(
//                                     color: kTitleColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18.0),
//                               ),
//                               const SizedBox(height: 8.0),
//                               Text(
//                                 'Utilisation',
//                                 style: kTextStyle.copyWith(
//                                   color: kGreyTextColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 10.0),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '7.50Hrs',
//                                 style: kTextStyle.copyWith(
//                                     color: kTitleColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18.0),
//                               ),
//                               const SizedBox(height: 8.0),
//                               Text(
//                                 'Chargeable',
//                                 style: kTextStyle.copyWith(
//                                   color: kGreyTextColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 10.0),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '15.50Hrs',
//                                 style: kTextStyle.copyWith(
//                                     color: kTitleColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18.0),
//                               ),
//                               const SizedBox(height: 8.0),
//                               Text(
//                                 'Non Chargeable',
//                                 style: kTextStyle.copyWith(
//                                   color: kGreyTextColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10.0),
//                       SizedBox(
//                         height: 5,
//                         child: ClipRRect(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                           child: LinearProgressIndicator(
//                             value: 0.3,
//                             valueColor: const AlwaysStoppedAnimation<Color>(
//                                 Color(0xffFF4444)),
//                             backgroundColor:
//                                 const Color(0xffFF4444).withOpacity(0.1),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Container(
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0), color: kWhite),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Expense',
//                         style: kTextStyle.copyWith(
//                             color: kSubTitleColor,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18.0),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         height: 5,
//                         child: ClipRRect(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(10)),
//                           child: LinearProgressIndicator(
//                             value: 0.8,
//                             valueColor: const AlwaysStoppedAnimation<Color>(
//                                 kGreenColor),
//                             backgroundColor: kGreenColor.withOpacity(0.1),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '$currencySign${65.45}',
//                                 style: kTextStyle.copyWith(
//                                     color: kTitleColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18.0),
//                               ),
//                               const SizedBox(height: 8.0),
//                               Text(
//                                 'Reimbursable',
//                                 style: kTextStyle.copyWith(
//                                   color: kGreyTextColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 10.0),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '$currencySign${65.45}',
//                                 style: kTextStyle.copyWith(
//                                     color: kTitleColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18.0),
//                               ),
//                               const SizedBox(height: 8.0),
//                               Text(
//                                 'Reimbursable',
//                                 style: kTextStyle.copyWith(
//                                   color: kGreyTextColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.0),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xFF00E8EA),
//                         Color(0xFF00B5E8),
//                       ],
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Daily Hours',
//                         style: kTextStyle.copyWith(
//                           color: kWhite,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       Text(
//                         'Trending',
//                         style: kTextStyle.copyWith(
//                           color: kWhite,
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),
//                       _buildDefaultSplineChart(),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0), color: kWhite),
//                   child: Column(
//                     children: [
//                       SfCircularChart(
//                         series: <CircularSeries>[
//                           // Renders doughnut chart
//                           DoughnutSeries<ChartData, String>(
//                               radius: '70%',
//                               innerRadius: '70%',
//                               dataSource: chartsData,
//                               pointColorMapper: (ChartData data, _) =>
//                                   data.color,
//                               xValueMapper: (ChartData data, _) => data.x,
//                               yValueMapper: (ChartData data, _) => data.y)
//                         ],
//                         legend: Legend(
//                           isVisible: true,
//                           position: LegendPosition.bottom,
//                           isResponsive: true,
//                           padding: 5,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         drawer: const DrawerWidget(),
//       ),
//     );
//   }
// }
