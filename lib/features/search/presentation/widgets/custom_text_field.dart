import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    required this.controller,
    this.suffixIcon,
  });

  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final void Function(String?)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.border,
      ),
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyLarge,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
