import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
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

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.hintText,
    this.isObscure = false,
    this.height = 48,
    this.width =424,
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
    this.borderRadius = 8,
  });

  Future<void> _handleDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        obscureText: isObscure,
        readOnly: textInputType == TextInputType.datetime || readOnly,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onTap: () async {
          if (onTap != null) onTap!();
          if (textInputType == TextInputType.datetime) {
            await _handleDatePicker(context);
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyles.hintTextStyle(),
          filled: true,
          fillColor: kWhiteColor,
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kContainerStroke,
            ),
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getWidth(16),
            vertical: getHeight(12),
          ),
        ),
        style: AppStyles.inputTextStyle(),
      ),
    );
  }
}
