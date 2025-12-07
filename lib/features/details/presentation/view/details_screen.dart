import 'package:final_route_projcet_c16/features/details/presentation/view_model/details_bloc/movie_details_bloc.dart';
import 'package:final_route_projcet_c16/features/details/presentation/view_model/suggestions_bloc/movie_suggestions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/details_header.dart';
import '../widgets/rating_row.dart';
import '../widgets/screenshots_list.dart';
import '../widgets/suggestions_list.dart';
import '../widgets/summary_section.dart';
import '../widgets/cast_section.dart';
import '../widgets/genres_section.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;

  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();

    // context.read<MovieDetailsBloc>().add(FetchMovieDetails(widget.movieId));
    // context.read<MovieSuggestionsBloc>().add(FetchSuggestions(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } 
                else if (state is MovieDetailsLoaded) {
                  return DetailsHeader(movie: state.movie);
                }
                return const SizedBox();
              },
            ),

            const SizedBox(height: 20),

            /// RATING ROW
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoaded) {
                  return RatingRow(movie: state.movie);
                }
                return const SizedBox();
              },
            ),

            const SizedBox(height: 20),

            /// SCREENSHOTS
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoaded) {
                  return ScreenshotsList(images: state.movie.screenshots);
                }
                return const SizedBox();
              },
            ),

            const SizedBox(height: 25),

            /// SUGGESTIONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Similar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            BlocBuilder<MovieSuggestionsBloc, MovieSuggestionsState>(
              builder: (context, state) {
                if (state is SuggestionsLoaded) {
                  return SuggestionsList(suggestions: state.suggestions);
                }
                return const SizedBox(height: 150);
              },
            ),

            const SizedBox(height: 25),

            /// SUMMARY
            Text("smmary"),
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoaded) {
                  return SummarySection(summary: state.movie.description);
                }
                return const SizedBox();
              },
            ),

            /// CAST
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoaded) {
                  return CastSection(cast: state.movie.cast);
                }
                return const SizedBox();
              },
            ),

            /// GENRES
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoaded) {
                  return GenresSection(genres: state.movie.genres);
                }
                return const SizedBox();
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
