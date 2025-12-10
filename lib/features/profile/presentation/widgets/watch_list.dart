import 'package:final_route_projcet_c16/core/constants/assets_manager.dart';
import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_bloc.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoritesLoaded) {
          if (state.items.isEmpty) {
            return Center(child: Image.asset(ImageAssets.emptySearch));
          }

          return GridView.builder(
            padding: REdgeInsets.all(12),
            itemCount: state.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final item = state.items[index];
              return MovieCard(
                ratingText: "${item.rating}",
                imageNetwork: (item.imageURL != null && item.imageURL.isNotEmpty)
                  ? item.imageURL
                  : "https://via.placeholder.com/300",
                movie: int.tryParse(item.movieId),
              );
            },
          );
        }
        return Center(child: Image.asset(ImageAssets.emptySearch));
      },
    );
  }
}
