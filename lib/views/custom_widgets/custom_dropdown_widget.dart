import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class CustomDropdownWidget extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hintText;
  final Function(String?) onChanged;
  final double height;
  final double width;
  final double borderRadius;

  const CustomDropdownWidget({
    super.key,
    required this.items,
    this.value,
    required this.hintText,
    required this.onChanged,
    this.height = 56,
    this.width = double.infinity,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(height),
      width: getWidth(width),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.08),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: value,

          hint: Text(hintText, style: AppStyles.hintTextStyle()),
          iconStyleData: IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down, color: kPrimaryColor),
          ),
          buttonStyleData: ButtonStyleData(
            height: getHeight(height),
            width: getWidth(width),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: kTextFieldStrokeColor, width: 0.8),
            ),
            padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          ),
          dropdownStyleData: DropdownStyleData(
            elevation: 8,
            offset: const Offset(0, 0),


            maxHeight: 300,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
              border: Border.all(color: kPrimaryColor, width: 1),
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.08),
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
          selectedItemBuilder: (context) {
            return items.map((item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item,
                  style: AppStyles.inputTextStyle().copyWith(
                    color: kBlack1Color,
                  ),
                ),
              );
            }).toList();
          },
          items: items.map((item) {
            final isSelected = item == value;
            final isLast = items.indexOf(item) == items.length - 1;

            return DropdownMenuItem<String>(
              value: item,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight(8)),
                    child: Text(
                      item,
                      style: isSelected
                          ? AppStyles.inputTextStyle().copyWith(
                              color: kPrimaryColor,
                            )
                          : AppStyles.inputTextStyle().copyWith(
                              color: kBlack1Color,
                            ),
                    ),
                  ),
                  if (!isLast) Container(height: 0.8, color: kDividerColor),
                ],
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }
}
