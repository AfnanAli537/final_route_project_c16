import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummarySection extends StatelessWidget {
  final List<MovieSuggestionEntity> summary;

  const SummarySection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Summary",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

         SizedBox(height: 10.h),

        ...summary.map((item) => Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              child: Text(
                item.summary ?? "",
                style:  TextStyle(
                  color: Colors.white70,
                  height: 1.4.h,
                ),
              ),
            )),
      ],
    );
  }
}
