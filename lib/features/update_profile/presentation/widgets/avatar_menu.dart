import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarMenu extends StatelessWidget {
  const AvatarMenu({
    super.key,
    required this.isSelected,
    this.avatar,
    this.widget,
  });

  final bool isSelected;
  final Widget? widget;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorManager.primary.withOpacity(0.4)
            : Colors.transparent,
        border: Border.all(
          color: ColorManager.primary,
          width: isSelected ? 3 : 1.5,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: widget,
    );
  }
}
