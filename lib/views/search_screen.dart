import 'package:desktivo/common/movies_list_tile.dart';
import 'package:desktivo/common/search_box.dart';
import 'package:desktivo/controllers/search_controller.dart';
import 'package:desktivo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchPageController _searchPageController = Get.find();

  @override
  void initState() {
    _searchPageController.performSearch("hou");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.searchHomeColor,
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
                width: 100.w,
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SearchBox(),
                    Obx(() {
                      return Expanded(
                        child: !_searchPageController.loading.value
                            ? ListView.builder(
                                itemCount: _searchPageController
                                    .finalSearchData.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return MoviesListTile(
                                    title: _searchPageController
                                        .finalSearchData[index]["Title"],
                                    genre: _searchPageController
                                        .finalSearchData[index]["Genre"],
                                    rating: _searchPageController
                                        .finalSearchData[index]["imdbRating"],
                                    image: _searchPageController
                                        .finalSearchData[index]["Poster"],
                                  );
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
