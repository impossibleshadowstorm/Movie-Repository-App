import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class RecentSection extends StatefulWidget {
  const RecentSection({super.key});

  @override
  State<RecentSection> createState() => _RecentSectionState();
}

class _RecentSectionState extends State<RecentSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Constants.homeTextColor1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.5.h),
        SizedBox(
          height: (150 + 2.h) * (Constants.recentSliderData.length / 2).ceil(),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (Constants.recentSliderData.length / 2).ceil(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  singleTile(index * 2),
                  if (index * 2 + 1 < Constants.recentSliderData.length)
                    singleTile(index * 2 + 1),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget singleTile(int index) {
    return Column(
      children: [
        SizedBox(height: index > 1 ? 2.h : 0.h),
        Container(
          height: 150,
          width: 50.w - 5.w,
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            image: const DecorationImage(
              image: AssetImage("assets/images/background1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constants.recentSliderData[index]["title"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              SvgPicture.asset(Constants.recentSliderData[index]["icon"]),
            ],
          ),
        ),
      ],
    );
  }
}
