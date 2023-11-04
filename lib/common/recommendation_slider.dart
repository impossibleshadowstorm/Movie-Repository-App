import 'package:desktivo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecommendationSlider extends StatefulWidget {
  const RecommendationSlider({super.key});

  @override
  State<RecommendationSlider> createState() => _RecommendationSliderState();
}

class _RecommendationSliderState extends State<RecommendationSlider> {
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
                "Recommended",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Constants.homeTextColor1,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Constants.card1Gradient2,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 190,
          width: 100.w,
          margin: EdgeInsets.symmetric(vertical: 1.5.h),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: Constants.recommendedSliderData.length,
            itemBuilder: (context, index) {
              return sliderTile(index);
            },
          ),
        )
      ],
    );
  }

  Widget sliderTile(int index) {
    return Container(
      height: 180,
      width: 80.w,
      margin: EdgeInsets.only(right: 5.w),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        image: DecorationImage(
          image: AssetImage(
            Constants.recommendedSliderData[index]["background"],
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constants.recommendedSliderData[index]["title"],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                Constants.recommendedSliderData[index]["subTitle"],
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(Constants.recommendedSliderData[index]["icon1"]),
              SizedBox(width: 5.w),
              SvgPicture.asset(Constants.recommendedSliderData[index]["icon2"]),
            ],
          )
        ],
      ),
    );
  }
}
