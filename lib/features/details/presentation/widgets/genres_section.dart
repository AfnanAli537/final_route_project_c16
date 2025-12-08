import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenresSection extends StatelessWidget {
  final List<String> genres;

  const GenresSection({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Genres",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 10.h),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: genres.map((g) {
              return Container(
                padding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color:ColorManager.border,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  g,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
