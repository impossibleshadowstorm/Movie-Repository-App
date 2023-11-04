import 'package:desktivo/controllers/search_controller.dart';
import 'package:desktivo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class HorizontalSlider extends StatefulWidget {
  const HorizontalSlider({super.key});

  @override
  State<HorizontalSlider> createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {
  final SearchPageController _searchPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 100.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constants.horizontalSliderData.length,
        itemBuilder: (context, index) {
          return InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {
              _searchPageController.selectedHorizontalSlider.value = index;
            },
            child: sliderTile(index),
          );
        },
      ),
    );
  }

  Widget sliderTile(int index) {
    return Obx(() {
      return Container(
        height: 45,
        margin: EdgeInsets.only(right: 2.5.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: _searchPageController.selectedHorizontalSlider.value == index
              ? Constants.boxShadowColor
              : Constants.navBgColor,
        ),
        child: Center(
          child: Text(
            Constants.horizontalSliderData[index],
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
