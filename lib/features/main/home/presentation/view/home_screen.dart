// ignore_for_file: deprecated_member_use
import 'dart:math';

import 'package:final_route_projcet_c16/core/constants/assets_manager.dart';
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/view_model/bloc/home_bloc.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/widgets/genre_section.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/widgets/movies_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> allGenres = [
      "Comedy",
      "Romance",
      "Thriller",
      "Action",
      "Documentary",
      "Crime",
      "Drama",
      "Horror",
      "Adventure",
      "Sci-Fi",
      "Biography",
      "History",
      "Sport",
      "Family",
      "Music",
      "War",
      "Animation",
      "Mystery",
      "Fantasy",
      "Talk-Show",
      "Musical",
      "Western",
      "Film-Noir",
      "News",
      "Reality-TV",
      "Game-Show",
    ];

    final random = Random();
    final firstGenre = allGenres[random.nextInt(allGenres.length)];
    String secondGenre;
    do {
      secondGenre = allGenres[random.nextInt(allGenres.length)];
    } while (secondGenre == firstGenre);

    context.read<MoviesBloc>().add(LoadAvailableMovies());
    context.read<MoviesBloc>().add(LoadMoviesByGenre(firstGenre));
    context.read<MoviesBloc>().add(LoadMoviesByGenre(secondGenre));
    return Scaffold(
      body: BlocConsumer<MoviesBloc, MoviesState>(
        listener: (context, state) {
          if (state.error != null && state.error!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final availableNow = state.availableNow;
          final bgImage = availableNow.isNotEmpty
              ? availableNow[state.currentCarouselIndex].image
              : '';

          return Stack(
            children: [
              if (bgImage!.isNotEmpty)
                Positioned.fill(
                  child: Image.network(bgImage, fit: BoxFit.cover),
                ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff121312).withOpacity(0.8),
                        Color(0xff121312).withOpacity(0.6),
                        Color(0xff121312),
                      ],
                      stops: [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child: Image.asset(
                            ImageAssets.availableNowImage,
                            width: 200.w,
                          ),
                        ),
                      ),

                      if (availableNow.isEmpty)
                        Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.secondary,
                          ),
                        )
                      else
                        MoviesCarousel(
                          movies: availableNow,
                          isLoadingMore: state.isLoadingMore,
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Center(
                          child: Image.asset(
                            ImageAssets.watchNowImage,
                            width: 220.w,
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      GenereSection(
                        context: context,
                        title: firstGenre.capitalize(),
                        movies: state.moviesByGenre[firstGenre] ?? [],
                      ),
                      SizedBox(height: 8.h),

                      GenereSection(
                        context: context,
                        title: secondGenre.capitalize(),
                        movies: state.moviesByGenre[secondGenre] ?? [],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

extension StringCasingExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}
