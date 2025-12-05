// ignore_for_file: deprecated_member_use
import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/view_model/bloc/home_bloc.dart';
import 'package:final_route_projcet_c16/features/main/home/presentation/widgets/GenreSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<MoviesBloc>().add(LoadAvailableMovies());
    context.read<MoviesBloc>().add(LoadMoviesByGenre("action"));
    context.read<MoviesBloc>().add(LoadMoviesByGenre("animation"));
  }
  @override
  Widget build(BuildContext context) {
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
              ? availableNow[_currentIndex].image
              : '';

          print(
            "AvailableNow length: ${state.availableNow.length}, isLoading: ${state.isLoading}",
          );

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
                        Color.fromRGBO(18, 19, 18, 0.8),
                        Color.fromRGBO(18, 19, 18, 0.6),
                        Color(0xFF121312),
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
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Image.asset(
                            "assets/images/available_now.png",
                            width: 200,
                          ),
                        ),
                      ),

                      if (availableNow.isEmpty)
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      else
                        CarouselSlider.builder(
                          itemCount: availableNow.length,
                          itemBuilder: (context, index, _) {
                            final movie = availableNow[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
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
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            movie.rating.toString(),
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                          ),
                                          const SizedBox(width: 4),
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
                            );
                          },
                          options: CarouselOptions(
                            height: 340,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.6,
                            onPageChanged: (index, reason) {
                              setState(() => _currentIndex = index);
                              final bloc = context.read<MoviesBloc>();
                              final state = bloc.state;
                              if (index >= state.availableNow.length - 2 &&
                                  !state.isLoadingMore &&
                                  !state.isOffline) {
                                bloc.add(LoadMoreAvailableMovies());
                              }
                            },
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Image.asset(
                            "assets/images/watch_now.png",
                            width: 220,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      GenereSection(
                        context: context,
                        title: "Action",
                        movies: state.moviesByGenre["action"] ?? [],
                      ),
                      const SizedBox(height: 8),

                      GenereSection(
                        context: context,
                        title: "Animation",
                        movies: state.moviesByGenre["animation"] ?? [],
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
