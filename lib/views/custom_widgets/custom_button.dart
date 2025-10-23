import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final double borderRadius;
  final String title;
  final Color textColor;
  final List<Color> colors;
  final double width;
  final double height;
  final double textSize;
  final FontWeight fontWeight;
  final Function()? onTap;
  final bool showShadow;
  final Color? borderColor;
  final String? icon;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor = kWhiteColor,
    this.fontWeight = FontWeight.w500,
    this.colors = const [kPrimaryColor, kPrimaryColor],
    this.width = 424,
    this.height = 56,
    this.borderRadius = 12,
    this.textSize = 18,
    this.showShadow = false,
    this.borderColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: getHeight(height),
        width: getWidth(width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 0.8,
          ),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Image.asset(
                  icon!,
                  height: getHeight(15),
                  width: getWidth(15),
                  color: kWhiteColor,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: getWidth(8)),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.buttonTextStyle().copyWith(color: textColor, fontWeight: fontWeight, fontSize: textSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
