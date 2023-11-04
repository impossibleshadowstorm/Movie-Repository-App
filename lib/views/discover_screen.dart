import 'package:desktivo/common/horizontal_slider.dart';
import 'package:desktivo/common/recent_section.dart';
import 'package:desktivo/common/recommendation_slider.dart';
import 'package:desktivo/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.homeBackgroundColor,
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.only(left: 5.w),
          child: Column(
            children: [
              Container(
                width: 100.w,
                padding: EdgeInsets.only(top: 2.5.h, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discover",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: .5.h),
                        Container(
                          height: 3,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: Constants.homeTextColor2,
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SearchScreen());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/search.svg",
                            color: Colors.white,
                          ),
                          SizedBox(height: .7.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.5.h),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const HorizontalSlider(),
                      SizedBox(height: 3.5.h),
                      const RecommendationSlider(),
                      SizedBox(height: 3.5.h),
                      const RecentSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
