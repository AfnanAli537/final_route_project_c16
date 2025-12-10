import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWatchHistoryList extends StatelessWidget {
  const CustomWatchHistoryList({
    super.key,
    required this.onTap,
    required this.colorSelected,
    required this.text,
    required this.icon,
  });

  final VoidCallback onTap;
  final Color colorSelected;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorSelected, width: 3.w),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: ColorManager.primary),
            SizedBox(height: 5.h),
            Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
