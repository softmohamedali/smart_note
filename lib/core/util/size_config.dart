import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class SizeCongig{
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orentation;

  static void init(BuildContext context)
  {
    screenHeight=MediaQuery.of(context).size.height;
    screenWidth=MediaQuery.of(context).size.width;
    orentation=MediaQuery.of(context).orientation;
    defaultSize=orentation==Orientation.landscape?screenHeight! * 0.024:
    screenWidth! * 0.024;
  }

}