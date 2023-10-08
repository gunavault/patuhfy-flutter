import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patuhfy/models/rtl_detail_list_model.dart';
import 'package:patuhfy/models/rtl_list_model.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/rtl_detail_form.dart';
import 'package:patuhfy/pages/rtl/rtl_detail/widget/rtLdetail_card.dart';
import 'package:patuhfy/utils/common_colors.dart';
import 'package:patuhfy/utils/common_method.dart';
import 'package:patuhfy/utils/text_style.dart';
import 'package:patuhfy/widgets/app_bar/app_bar.dart';

class RtlDetailPage extends StatelessWidget {
  const RtlDetailPage(
      {super.key, required this.dataRtl, required this.dataRtlDetail});
  final RtlListModel dataRtl;
  final List<RtlDetailListModel> dataRtlDetail;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayOpacity: 0.4,
      // overlayColor: Colors.black.withOpacity(0.4),
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30.0, right: 10),
          child: FloatingActionButton(
            elevation: 1,
            child: const Icon(Icons.add), //child widget inside this button
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FormRtlDetailForm(
                    dataRtl: dataRtl,
                  ),
                ),
              );
              //task to execute when this button is pressed
            },
          ),
        ),
        backgroundColor: CommonColors.whiteColor,
        appBar: AppBarView(
          title: "List Detail RTL",
          firstIcon: Icons.arrow_back_ios_new_rounded,
          onBackPress: () {
            Navigator.pop(context);
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 26, right: 26, bottom: 0),
                    child: SizedBox(
                      height: 1,
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 26, right: 26, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Issue : ",
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dataRtl.deskripsi.toString(),
                                  style: CommonStyle.getRalewayFont(
                                    color: CommonColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin:
                          const EdgeInsets.only(right: 40, left: 10, top: 10),
                      decoration: BoxDecoration(
                        color: CommonMethods.colorBadge(dataRtl.status),
                        boxShadow: const [BoxShadow(color: Colors.transparent)],
                        border: Border.all(
                            color: const Color.fromARGB(255, 237, 236, 236)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Text(
                        dataRtl.status.toString(),
                        style: const TextStyle(
                            fontSize: 16, color: Color(0XFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 26, right: 26, bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CommonColors.bottomIconColor.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.calendar_month,
                          color: CommonColors.bottomIconColor,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        dataRtl.mobileCreatedAt.toString(),
                        style: CommonStyle.getRalewayFont(
                          color: CommonColors.blackColor1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 26, right: 26, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CommonColors.bottomIconColor.withOpacity(0.2),
                        ),
                        child: const Icon(
                          Icons.tag,
                          color: CommonColors.bottomIconColor,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        // margin:
                        //     const EdgeInsets.only(right: 40, left: 10, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CommonColors.bottomIconColor.withOpacity(0.2),
                        ),
                        child: Text(
                          dataRtl.kategori.toString(),
                          style: CommonStyle.getRalewayFont(
                            color: CommonColors.blackColor1,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RtlDetailCard(
                  dataRtlDetail: dataRtlDetail,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget overlapped() {
    const overlap = 30;
    final items = [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CommonColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: NetworkImage(
                  'https://uploads-ssl.webflow.com/60c11f0c32e847294cfbcb6c/60c1401d63769509bd4e72cd_Rectangle%202.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CommonColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: NetworkImage(
                  'https://w0.peakpx.com/wallpaper/763/605/HD-wallpaper-chris-pine-american-actor-portrait-handsome-man-american-stars.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CommonColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: NetworkImage(
                  'https://media.istockphoto.com/id/644244886/photo/portrait-of-businessman-in-office-standing-by-window.jpg?b=1&s=170667a&w=0&k=20&c=g9g077LMBXXEynx8xcKeEjH6r6Q4svu5OzT5zOSzGoM='),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CommonColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: NetworkImage(
                  'https://media.istockphoto.com/id/503918553/photo/happiness-is-not-trying-or-finding-its-deciding.jpg?s=612x612&w=0&k=20&c=WFc4kZTwbtneCvuRdlB9fVkZUVV7siS5mKud4XKBuE4='),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: CommonColors.containerIconB,
        ),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(color: CommonColors.whiteColor, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.add,
              color: CommonColors.bottomIconColor,
            ),
          ),
        ),
      ),
    ];
    List<Widget> stackLayers = List<Widget>.generate(
      items.length,
      (index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
          child: items[index],
        );
      },
    );
    return Stack(children: stackLayers);
  }
}
