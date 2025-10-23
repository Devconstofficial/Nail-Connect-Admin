import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class CustomTextField2 extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final bool isObscure;
  final double height;
  final double width;
  final bool isStyle;
  final TextInputType textInputType;
  final bool readOnly;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final double borderRadius;

  const CustomTextField2({
    super.key,
    this.controller,
    this.focusNode,
    required this.hintText,
    this.isObscure = false,
    this.height = 56,
    this.width = 342,
    this.isStyle = false,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.suffix,
    this.suffixText,
    this.prefix,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.inputFormatters,
    this.borderRadius = 12,
  });

  Future<void> _handleDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor,
              onPrimary: Colors.white,
              onSurface: kBlack1Color,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null && controller != null) {
      final formatted = DateFormat('MM/dd/yyyy').format(selectedDate);
      controller!.text = formatted;
    }
  }

  Future<void> _handleTimePicker(BuildContext context) async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor,
              onPrimary: Colors.white,
              onSurface: kBlack1Color,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null && controller != null) {
      final now = DateTime.now();
      final selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      final formattedTime = DateFormat('hh:mm a').format(selectedDateTime);
      controller!.text = formattedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        obscureText: isObscure,
        readOnly: readOnly ||
            textInputType == TextInputType.datetime ,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onTap: () async {
          if (onTap != null) onTap!();
          if (textInputType == TextInputType.datetime) {
            await _handleDatePicker(context);
          } else if (hintText == '--:--:--') {
            await _handleTimePicker(context);
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyles.hintTextStyle().copyWith(color: kBlack1Color.withOpacity(0.5)),
          filled: true,
          fillColor: kTextFieldFillColor,
          prefixIcon: prefix != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: prefix,
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          suffixIcon: suffix != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: suffix,
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          suffix: suffixText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: getWidth(16),
            vertical: getHeight(16),
          ),
        ),
        style: AppStyles.inputTextStyle().copyWith(fontSize: 12.sp),
      ),
    );
  }
}
