import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionsSliverGrid extends StatelessWidget {
  final List<MovieSuggestionEntity> suggestions;

  const SuggestionsSliverGrid({super.key, required this.suggestions});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:  EdgeInsets.all(12.h),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return MovieCard(
              ratingText: suggestions[index].rating.toString(),
              imageNetwork: suggestions[index].poster ?? '',
              movie: suggestions[index].id,
            );
          },
          childCount: suggestions.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
      ),
    );
  }
}
