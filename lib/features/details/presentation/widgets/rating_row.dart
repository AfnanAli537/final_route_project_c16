import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  final MovieDetailsEntity movie;

  const RatingRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ratingBox(Icons.favorite, movie.likeCount.toString()),
          _ratingBox(Icons.remove_red_eye, movie.runtime.toString()),
          _ratingBox(Icons.star, movie.rating.toString()),
        ],
      ),
    );
  }

  Widget _ratingBox(IconData icon, String text) {
    return Container(
      width: 90,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xffF6C700),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 22),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
