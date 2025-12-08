import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/is_watch_later.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/url_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsHeader extends StatelessWidget {
  final MovieDetailsEntity movie;

  const DetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie.poster ?? "",
          width: double.infinity,
          height: 450.h,

          fit: BoxFit.cover,
        ),

        Container(
          height: 580.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, ColorManager.black.withOpacity(0.6)],
            ),
          ),
        ),

        Positioned(
          top: 50,
          left: 10,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),

        Positioned(top: 50, right: 10, child: BookmarkButton()),

        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 200.h),
            child: Container(
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.all(6.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                  child: Icon(Icons.play_arrow, size: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Column(
            children: [
              SizedBox(height: 5),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                movie.year.toString(),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              WatchButton(url: movie.url),
                  Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ratingBox(Icons.favorite, movie.likeCount.toString()),
                    _ratingBox(Icons.remove_red_eye, movie.runtime.toString()),
                    _ratingBox(Icons.star, movie.rating.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _ratingBox(IconData icon, String text) {
  return Container(
    width: 90.w,
    height: 48.h,
    decoration: BoxDecoration(
      color: ColorManager.border,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.yellow, size: 22),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
