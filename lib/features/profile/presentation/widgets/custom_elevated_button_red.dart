import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButtonRed extends StatelessWidget {
  const CustomElevatedButtonRed({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.error ,
        foregroundColor: ColorManager.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(14.r),
        ),
      ),
      child: Padding(
        padding: REdgeInsets.only(left: 8.0),
        child: child
      ),
    );
  }
}
