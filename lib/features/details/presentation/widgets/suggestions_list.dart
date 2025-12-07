import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionsList extends StatelessWidget {
  final List<MovieSuggestionEntity> suggestions;

  const SuggestionsList({super.key, required this.suggestions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: GridView.builder(
       padding: EdgeInsets.all(12),
       gridDelegate:
       const SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
         crossAxisSpacing: 12,
         mainAxisSpacing: 12,
         childAspectRatio: 0.65,
         
       ),
       itemCount: suggestions.length,
       itemBuilder: (context, index) => MovieCard(
         ratingText: suggestions[index].rating.toString(),
         imageNetwork: suggestions[index].poster??'',
       ),
                            ),
    );
    //   ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //     itemCount: suggestions.length,
    //     itemBuilder: (context, index) {
    //       final movie = suggestions[index];

    //       return Padding(
    //         padding: const EdgeInsets.only(right: 12),
    //         child: Column(
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(12),
    //               child: Image.network(
    //                 movie.poster ??'',
    //                 width: 120,
    //                 height: 170,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             const SizedBox(height: 5),
    //             Row(
    //               children: [
    //                 Text(
    //                   movie.rating.toString(),
    //                   style: const TextStyle(color: Colors.white),
    //                 ),
    //                 const Icon(Icons.star, color: Colors.yellow, size: 16),
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
