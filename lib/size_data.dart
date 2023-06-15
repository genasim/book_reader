import 'package:flutter/material.dart';

late MediaQueryData _mediaQueryData;
late double screenWidth;
late double screenHeight;
late Orientation orientation;
late double defaultSize;

void configSizeData(BuildContext context) {
  _mediaQueryData = MediaQuery.of(context);
  screenHeight = _mediaQueryData.size.height;
  screenWidth = _mediaQueryData.size.width;
  orientation = _mediaQueryData.orientation;

  defaultSize = orientation == Orientation.landscape
      ? screenHeight * 0.035
      : screenWidth * 0.035;
}
