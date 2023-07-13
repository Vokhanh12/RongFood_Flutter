import 'package:flutter/material.dart';

class AppSettings {
  static double titleFontSize = 20.0;
  static double bodyFontSize = 16.0;
  static double logoScreenHeigthPhone = 400;
  static double logoScreenWidthPhone = 400;

  static void setup(BuildContext context) {
    // Lấy kích thước màn hình hiện tại
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    // Thiết lập giá trị cấu hình dựa trên kích thước màn hình
    if (screenWidth < 600) {
      titleFontSize = 17.0;
      bodyFontSize = 15.0;
    } else if (screenWidth >= 600 && screenWidth < 1200) {
      titleFontSize = 21.0;
      bodyFontSize = 17.0;
    } else {
      titleFontSize = 25.0;
      bodyFontSize = 19.0;
    }

    if (screenHeigth <= 732)
      logoScreenHeigthPhone = 250;
    else
      logoScreenHeigthPhone = 350;
  }
}
