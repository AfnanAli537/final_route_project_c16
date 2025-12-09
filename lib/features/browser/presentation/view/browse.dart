import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view_model/bloc/browse_bloc.dart';
import 'package:final_route_projcet_c16/features/browser/presentation/view_model/bloc/browse_state.dart';
import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view_model/bloc/browse_event.dart';

class Browse extends StatefulWidget {
  final String? selectedGenre;
  final bool showBackButton;
  const Browse({super.key, this.selectedGenre,  this.showBackButton= false});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  late String selectedGenre = "";

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: widget.showBackButton
        ? AppBar(
            backgroundColor: ColorManager.background,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              selectedGenre ,
              style: TextStyle(color: Colors.white),
            ),
          )
        : null,
      body: SafeArea(
        child: BlocBuilder<BrowseBloc, BrowseState>(
          builder: (context, state) {
            if (state is BrowseInitial) {
              context.read<BrowseBloc>().add(LoadMovieEvent());
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BrowseLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BrowseError) {
              return Center(child: Text(state.message));
            }
            if (state is BrowseLoaded) {
              final movies = state.movies;
              final genres = <String>{};
              for (var m in movies) {
                genres.addAll(m.genres);
              }
              final genreList = genres.toList();
              if (selectedGenre.isEmpty && genreList.isNotEmpty) {
                selectedGenre = genreList.first;
              }
              final filteredMovies = movies
                  .where(
                    (m) => m.genres
                        .map((g) => g.toLowerCase())
                        .contains(selectedGenre.toLowerCase()),
                  )
                  .toList();
              return Column(
                children: [
                  SizedBox(
                    height: 67.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final genre = genreList[index];
                        final isSelected = genre == selectedGenre;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGenre = genre;
                            });
                          },
                          child: Container(
                            margin: REdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 10,
                            ),
                            padding: REdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? ColorManager.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(
                                color: ColorManager.primary,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              genre,
                              style: GoogleFonts.inter(
                                color: isSelected
                                    ? ColorManager.black
                                    : ColorManager.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: genreList.length,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 8.0),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.65,
                            ),
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          final movie = filteredMovies[index];
                          return MovieCard(
                            ratingText: movie.rating.toString(),
                            imageNetwork: movie.image,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
