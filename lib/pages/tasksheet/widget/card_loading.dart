import 'package:flutter/material.dart';
import 'package:patuhfy/widgets/constant.dart';
import 'package:shimmer/shimmer.dart';

class CardDashboardLoading extends StatelessWidget {
  // DashboardDataModel item;this.item
  const CardDashboardLoading({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Container(
              height: 50.0,
              width: 50.0,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              )),
        ),
        const SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: Column(
                children: [
                  Container(
                    width: 250,
                    // width: double.infinity,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 250,
                    // width: double.infinity,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 250,
                    // width: double.infinity,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
        const Spacer(),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: const Icon(
            Icons.verified,
            color: kBlueColor,
          ),
        )
      ],
    );
  }
}
