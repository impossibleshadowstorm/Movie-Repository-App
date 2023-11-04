import 'package:desktivo/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final SearchPageController _searchPageController = Get.find();
  final Debouncer _debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Center(
        child: TextFormField(
          onChanged: (val) {
            _debouncer.debounce(const Duration(milliseconds: 500), () async {
              await _searchPageController.performSearch(val);
              _searchPageController.searchResults[0];
            });
          },
          controller: _searchPageController.searchTextController,
          cursorColor: Colors.black12,
          style: TextStyle(color: Colors.black87, fontSize: 15.sp),
          cursorHeight: 20,
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            suffixIcon: Icon(Icons.search),
            hintText: "Search for movies [At least 3 characters]",
          ),
        ),
      ),
    );
  }
}
