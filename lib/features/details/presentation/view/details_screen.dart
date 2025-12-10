import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';
import 'package:final_route_projcet_c16/features/details/presentation/view_model/details_bloc/movie_details_bloc.dart';
import 'package:final_route_projcet_c16/features/details/presentation/view_model/suggestions_bloc/movie_suggestions_bloc.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/cast_section.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/details_header.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/genres_section.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/screenshots_list.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/suggestions_list.dart';
import 'package:final_route_projcet_c16/features/details/presentation/widgets/summary_section.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_bloc.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  final int movieId;

  const DetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, detailsState) {
        if (detailsState is MovieDetailsLoading) {
          return const Scaffold(
            backgroundColor: ColorManager.black,
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (detailsState is MovieDetailsLoaded) {
          final movie = detailsState.movie;

          return BlocBuilder<MovieSuggestionsBloc, MovieSuggestionsState>(
            builder: (context, suggestionsState) {
              final suggestions = (suggestionsState is SuggestionsLoaded)
                  ? suggestionsState.suggestions
                  : <MovieSuggestionEntity>[];

              return Scaffold(
                backgroundColor: ColorManager.black,
                body: CustomScrollView(
                  slivers: [
                    if (movie.poster != null && movie.poster!.isNotEmpty)
                      SliverToBoxAdapter(
                        child: DetailsHeader(
                          movie: movie,
                          onRefresh: () {
                            context.read<FavoriteBloc>().add(
                              LoadFavoritesEvent(),
                            );
                          },
                        ),
                      ),

                    SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                    if (movie.screenshots!.isNotEmpty)
                      SliverToBoxAdapter(
                        child: ScreenshotsList(images: movie.screenshots),
                      ),
                    SliverToBoxAdapter(child: SizedBox(height: 25.h)),

                    if (suggestions.isNotEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            "Similar",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (suggestions.isNotEmpty)
                      SuggestionsSliverGrid(suggestions: suggestions),
                    SliverToBoxAdapter(child: SizedBox(height: 25.h)),

                    if (suggestions.isNotEmpty)
                      SliverToBoxAdapter(
                        child: SummarySection(summary: suggestions),
                      ),

                    if (movie.cast!.isNotEmpty)
                      SliverToBoxAdapter(child: CastSection(cast: movie.cast)),

                    if (movie.genres!.isNotEmpty)
                      SliverToBoxAdapter(
                        child: GenresSection(genres: movie.genres),
                      ),

                    SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                  ],
                ),
              );
            },
          );
        }

        return const Scaffold(
          backgroundColor: ColorManager.black,
          body: SizedBox.shrink(),
        );
      },
    );
  }
}
