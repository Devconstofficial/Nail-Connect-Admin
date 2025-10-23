import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle onBoardingTextStyleHeading() => GoogleFonts.plusJakartaSans(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: kBlack1Color,
    letterSpacing: 0,
  );

  static TextStyle onBoardingTextStyleSubtitle() => GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: kNormalTextColor,
  );

  static TextStyle buttonTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: kWhiteColor,
  );

  static TextStyle blackHeadingTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: kBlack1Color,
  );

  static TextStyle blackSubheadingTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: kHintBlackColor.withOpacity(0.7),
    letterSpacing: 0.01,
  );

  static TextStyle menuTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: kBlack1Color.withOpacity(0.5),
    letterSpacing: 0.01,
  );

  static TextStyle labelTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kBlack1Color,
  );

  static TextStyle hintTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: kContainerStroke.withOpacity(0.8),
  );

  static TextStyle inputTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kHintBlackColor,
  );

  static TextStyle otpTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    color: kBlack1Color,
    letterSpacing: -0.1,
  );

  static TextStyle profileOptionsTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kBlack1Color,
    letterSpacing: 0,
  );

  static TextStyle headerTextStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: kWhiteColor,
    letterSpacing: 0.01,
  );

  static TextStyle tableViewActiveTextStyle() => GoogleFonts.afacad(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: kBlackColor,
    letterSpacing: -0.01,
  );

  static TextStyle tableViewInctiveTextStyle() => GoogleFonts.afacad(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: kBlackColor,
    letterSpacing: -0.01,
  );
  static TextStyle smallTextStyle() => GoogleFonts.afacad(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: kBlack1Color,
  );

  static TextStyle shiftTitleTextStyle() => GoogleFonts.afacad(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: kBlackColor,
  );

  static TextStyle shiftNormalTextStyle() => GoogleFonts.afacad(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: kBlack1Color.withOpacity(0.6),
  );

  static TextStyle blackTextStyle() => GoogleFonts.afacad(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: kBlack1Color,
  );

  static TextStyle tableHeaderTextStyle() => GoogleFonts.afacad(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: kHintBlackColor,
  );

  static TextStyle tableItemTextStyle() => GoogleFonts.afacad(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: kBlackColor,
  );
}
