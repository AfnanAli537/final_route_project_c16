import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastSection extends StatelessWidget {
  final List<Cast> cast;

  const CastSection({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 300.h,
            child: ListView.builder(
              itemCount: cast.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final actor = cast[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: ColorManager.border,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          actor.profileImage,
                          width: 70.h,
                          height: 70.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Name: ${actor.name}\nCharacter: ${actor.character}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
