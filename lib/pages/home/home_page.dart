// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nusakita/blocs/auth_user/auth_user_cubit.dart';
// import 'package:nusakita/blocs/type_user/type_user_cubit.dart';
// import 'package:nusakita/configs/routers.dart';
// import 'package:nusakita/configs/styles.dart';
// import 'package:nusakita/pages/customer/customer_page.dart';
// import 'package:nusakita/pages/dashboard/sales/dashboard_sales_page.dart';
// import 'package:nusakita/pages/home/drawer_home.dart';
// import 'package:nusakita/pages/outlet/outlet_page.dart';
// import 'package:nusakita/pages/pjp/input_pjp_target_page.dart';
// import 'package:nusakita/pages/pjp/performa_pjp_page.dart';
// import 'package:nusakita/pages/produk_dan_stok/produk_and_stok_page.dart';
// import 'package:nusakita/pages/salesman/list_salesman_page.dart';
// import 'package:nusakita/widgets/background2.dart';
// import 'package:nusakita/widgets/item_menu_button.dart';
// import 'package:nusakita/widgets/item_promo.dart';
// import 'package:nusakita/widgets/top_sales/list_top_sales_home.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: const [
//           BaseBackground2(),
//           SafeArea(child: Content()),
//         ],
//       ),
//       drawer: const DrawerHome(),
//     );
//   }
// }

// class Content extends StatelessWidget {
//   const Content({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         //appBar
//         SliverAppBar(
//           floating: true,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.menu,
//               color: coklatKita,
//             ),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//           title: Center(
//             child: Image.asset(
//               "assets/images/logo1.png",
//               fit: BoxFit.cover,
//               height: 60,
//             ),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.white,
//           actions: [
//             IconButton(
//               icon: const Icon(
//                 Icons.notifications,
//                 color: coklatKita,
//               ),
//               onPressed: () {},
//             )
//           ],
//         ),
//         //Box Profile
//         SliverToBoxAdapter(
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             margin: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: cardColor1,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ClipOval(
//                   child: Image.asset(
//                     "assets/images/default_image.jpg",
//                     height: 45,
//                     width: 45,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Expanded(
//                   child: BlocBuilder<AuthUserCubit, AuthUserState>(
//                     builder: (context, authUserState) {
//                       if (authUserState is AuthUserSuccessState) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "${authUserState.userModel?.name}",
//                               style: body1.copyWith(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 19,
//                               ),
//                             ),
//                             Text(
//                               "${authUserState.userModel?.namaUnit}",
//                               style: body1.copyWith(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         );
//                       } else {
//                         return const Text("No Data");
//                       }
//                     },
//                   ),
//                 ),
//                 Text(
//                   "#5",
//                   style: textAngka.copyWith(
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         //Box Menu
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           sliver: BlocBuilder<TypeUserCubit, TypeUserState>(
//             builder: (context, typeUserState) {
//               if (typeUserState is TypeUserHoldingState) {
//                 return const ListMenuButtonHolding();
//               } else {
//                 return const ListMenuButtonSales();
//               }
//             },
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Container(
//             height: 16,
//           ),
//         ),
//         //Top Sales
//         SliverToBoxAdapter(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Top Sales",
//                   style: heading1,
//                 ),
//                 TextButton(
//                   child: Text(
//                     "See more",
//                     style: linkText,
//                   ),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const ListTopSalesHome(),
//         //Promo
//         SliverToBoxAdapter(
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Promo",
//                   style: heading1,
//                 ),
//                 TextButton(
//                   child: Text(
//                     "See more",
//                     style: linkText,
//                   ),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           sliver: SliverGrid.count(
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             childAspectRatio: 0.95,
//             crossAxisCount: 2,
//             children: const [
//               ItemPromo(),
//               ItemPromo(),
//               ItemPromo(),
//               ItemPromo(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ListMenuButtonSales extends StatelessWidget {
//   const ListMenuButtonSales({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid.count(
//       mainAxisSpacing: 16,
//       crossAxisSpacing: 16,
//       childAspectRatio: 0.9,
//       crossAxisCount: 4,
//       children: [
//         PopupMenuButton<String>(
//           child: const ItemMenuButton(
//             name: "PJP",
//             icon: Icons.edit,
//           ),
//           onSelected: (String result) {
//             if (result == "target") {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (context) => const InputPjpTargetPage()),
//               // );
//             } else if (result == "realisasi") {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const PerformaPjpPage()),
//               );
//             }
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//             const PopupMenuItem<String>(
//               value: "target",
//               child: Text('Target'),
//             ),
//             const PopupMenuItem<String>(
//               value: "realisasi",
//               child: Text('Realisasi'),
//             ),
//           ],
//         ),
//         ItemMenuButton(
//           name: "Produk &\nStock",
//           icon: Icons.padding,
//           onClick: () {
//             Navigator.of(context).pushNamed(MyRouters.produkStok);
//           },
//         ),
//         PopupMenuButton<String>(
//           child: const ItemMenuButton(
//             name: "Outlet &\nCustomer",
//             icon: Icons.store,
//           ),
//           onSelected: (String result) {
//             if (result == "outlet") {
//               Navigator.of(context).pushNamed(MyRouters.outlet);
//             } else if (result == "customer") {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const CustomerPage()),
//               );
//             }
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//             const PopupMenuItem<String>(
//               value: "outlet",
//               child: Text('Outlet'),
//             ),
//             const PopupMenuItem<String>(
//               value: "customer",
//               child: Text('Customer'),
//             ),
//           ],
//         ),
//         ItemMenuButton(
//           name: "Sales Order",
//           icon: Icons.more_time,
//           onClick: () {
//             Navigator.of(context).pushNamed(MyRouters.salesOrder);
//           },
//         ),
//         PopupMenuButton<String>(
//           child: const ItemMenuButton(
//             name: "Outstanding",
//             icon: Icons.query_stats_outlined,
//           ),
//           onSelected: (String result) {
//             if (result == "Sales Order") {
//               Navigator.of(context).pushNamed(MyRouters.outStandingSalesOrder);
//             } else if (result == "Request Transfer") {
//               Navigator.of(context)
//                   .pushNamed(MyRouters.outStandingRequestTransfer);
//             } else if (result == "Invoice") {
//               Navigator.of(context).pushNamed(MyRouters.outStandingInvoice);
//             }
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//             const PopupMenuItem<String>(
//               value: "Sales Order",
//               child: Text('Sales Order'),
//             ),
//             const PopupMenuItem<String>(
//               value: "Request Transfer",
//               child: Text('Request Transfer'),
//             ),
//             const PopupMenuItem<String>(
//               value: "Invoice",
//               child: Text('Invoice'),
//             ),
//           ],
//         ),
//         // ItemMenuButton(
//         //   name: "Salesman",
//         //   icon: Icons.people,
//         //   onClick: () {
//         //     Navigator.push(
//         //       context,
//         //       MaterialPageRoute(builder: (context) => const ListSalesmanPage()),
//         //     );
//         //   },
//         // ),
//       ],
//     );
//   }
// }

// class ListMenuButtonHolding extends StatelessWidget {
//   const ListMenuButtonHolding({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid.count(
//       mainAxisSpacing: 16,
//       crossAxisSpacing: 16,
//       childAspectRatio: 0.9,
//       crossAxisCount: 4,
//       children: [
//         PopupMenuButton<String>(
//           child: const ItemMenuButton(
//             name: "Dashboard",
//             icon: Icons.edit,
//           ),
//           onSelected: (String result) {
//             if (result == "target") {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (context) => const InputPjpTargetPage()),
//               // );
//             } else if (result == "realisasi") {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const PerformaPjpPage()),
//               );
//             }
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//             const PopupMenuItem<String>(
//               value: "target",
//               child: Text('Target'),
//             ),
//             const PopupMenuItem<String>(
//               value: "realisasi",
//               child: Text('Realisasi'),
//             ),
//           ],
//         ),
//         PopupMenuButton<String>(
//           child: const ItemMenuButton(
//             name: "Outlet &\nCustomer",
//             icon: Icons.store,
//           ),
//           onSelected: (String result) {
//             if (result == "outlet") {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const OutletPage()),
//               );
//             } else if (result == "customer") {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const CustomerPage()),
//               );
//             }
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//             const PopupMenuItem<String>(
//               value: "outlet",
//               child: Text('Outlet'),
//             ),
//             const PopupMenuItem<String>(
//               value: "customer",
//               child: Text('Customer'),
//             ),
//           ],
//         ),
//         ItemMenuButton(
//           name: "Produk &\nStock",
//           icon: Icons.padding,
//           onClick: () {
//             Navigator.of(context).pushNamed(MyRouters.produkStok);
//           },
//         ),
//         ItemMenuButton(
//           name: "Penjualan",
//           icon: Icons.point_of_sale_sharp,
//           onClick: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const DashboardSalesPage(),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
