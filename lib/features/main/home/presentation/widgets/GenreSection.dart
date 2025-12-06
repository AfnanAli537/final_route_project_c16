import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenereSection extends StatefulWidget {
  final BuildContext context;
  final String title;
  final List<Movie>? movies;
  const GenereSection({
    super.key,
    required this.context,
    required this.title,
    required this.movies,
  });

  @override
  State<GenereSection> createState() => _GenereSectionState();
}

class _GenereSectionState extends State<GenereSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.browse,
                    arguments: widget.title,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "See More",
                      style: TextStyle(
                        color: ColorManager.secondary,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: ColorManager.secondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 220.h,
          child: ListView.separated(
            padding: EdgeInsets.all(10.h),
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies?.length ?? 0,

            itemBuilder: (context, index) {
              final movie = widget.movies![index];
              return MovieCard(
                ratingText: movie.rating.toString(),
                imageNetwork: movie.image ?? "",
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
          ),
        ),
      ],
    );
  }
}
