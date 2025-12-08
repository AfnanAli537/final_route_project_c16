import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/view_model/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesCarousel extends StatelessWidget {
  final List<Movie> movies;
  final bool isLoadingMore;

  const MoviesCarousel({
    super.key,
    required this.movies,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty && !isLoadingMore) {
      return Center(
        child: CircularProgressIndicator(color: ColorManager.secondary),
      );
    }

    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, _) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, AppRoutes.details, arguments: movie.id),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    movie.image ?? "",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          movie.rating.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.star,
                          color: ColorManager.secondary,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 340.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.66.w,
        onPageChanged: (index, reason) {
          final bloc = context.read<MoviesBloc>();
          final state = bloc.state;
          if (index >= state.availableNow.length - 2 && !state.isLoadingMore) {
            bloc.add(LoadMoreAvailableMovies());
          }
          bloc.add(CarouselIndexChanged(index));
        },
      ),
    );
  }
}
