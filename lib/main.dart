import 'package:desktivo/controllers/search_controller.dart';
import 'package:desktivo/services/global.dart';
import 'package:desktivo/views/discover_screen.dart';
import 'package:desktivo/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SearchPageController _searchPageController =
      Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, type) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desktivo Tech',
        theme: ThemeData(
          fontFamily: "SF",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DiscoverScreen(),
      );
    });
  }
}
