import 'dart:ui';

class Constants {
  //----------------------------------------------------------------
  // Color Constants
  //----------------------------------------------------------------
  static Color homeBackgroundColor = const Color(0xff121421);
  static Color homeTextColor1 = const Color(0xff515979);
  static Color homeTextColor2 = const Color(0xff4A80F0);
  // Card Gradient Color
  static Color card1Gradient1 = const Color(0xff441DFC);
  static Color card1Gradient2 = const Color(0xff4E81EB);
  static Color card2Gradient1 = const Color(0xff13DEA0);
  static Color card2Gradient2 = const Color(0xff06B782);
  static Color card3Gradient1 = const Color(0xffFC67A7);
  static Color card3Gradient2 = const Color(0xffF6815B);
  static Color card4Gradient1 = const Color(0xffFFD541);
  static Color card4Gradient2 = const Color(0xffF0B31A);
  // Navigation Color
  static Color navBgColor = const Color(0xff1C2031);
  static Color selectedNavColor = const Color(0xffff8f00);
  static Color boxShadowColor = const Color(0xff4A80F0);
//   Search
  static Color searchHomeColor = const Color(0xfff5f5f5);

// rough
//   static Color primaryColor = const Color(0xff111B31);
//   static Color lightGreyBorderColor = const Color(0xffEEF0F2);
//   static Color darkGreyTextColor = const Color(0xffB4B5C3);
//   static Color midGreyTextColor = const Color(0xffB4B5C3);
//   static Color lightGreyTextColor = const Color(0xFF707E94);
//   static Color darkBlackTextColor = const Color(0xFF060606);
//   static Color lightBackgroundColor = const Color(0xFFF9F9F9);

  //----------------------------------------------------------------
  // Lists Constants
  //----------------------------------------------------------------
  static List<String> horizontalSliderData = [
    "Insomnia",
    "Depression",
    "Baby Sleep",
    "Fever",
  ];

  static List<Map<String, dynamic>> recommendedSliderData = [
    {
      "title": "Sleep Meditation",
      "subTitle": "7 Day Audio Series",
      "background": "assets/images/background1.png",
      "icon1": "assets/icons/headphone.svg",
      "icon2": "assets/icons/tape.svg",
    },
    {
      "title": "Sleep Meditation",
      "subTitle": "7 Day Audio Series",
      "background": "assets/images/backgroun2.png",
      "icon1": "assets/icons/headphone.svg",
      "icon2": "assets/icons/tape.svg",
    },
  ];

  static List<Map<String, dynamic>> recentSliderData = [
    {
      "title": "Calming Sounds",
      "icon": "assets/icons/headphone.svg",
    },
    {
      "title": "Insomnia",
      "icon": "assets/icons/tape.svg",
    },
    {
      "title": "For Children",
      "icon": "assets/icons/tape.svg",
    },
    {
      "title": "Tips For Sleeping",
      "icon": "assets/icons/heart.svg",
    },
    {
      "title": "Tips For Sleeping",
      "icon": "assets/icons/heart.svg",
    }
  ];

  // ----------------------------------------------------------------
  // Preferences Key Constants
  //----------------------------------------------------------------
  static const String stationCode = "StationCode";
}
