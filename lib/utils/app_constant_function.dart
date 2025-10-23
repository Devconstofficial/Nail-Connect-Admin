import 'package:responsive_sizer/responsive_sizer.dart';

double getWidth(double pixelValue) {
  double baseScreenWidth = 1440.0;
  return (pixelValue / baseScreenWidth) * 100.w;
}

double getHeight(double pixelValue) {
  double baseScreenHeight = 1024.0;
  return (pixelValue / baseScreenHeight) * 100.h;
}