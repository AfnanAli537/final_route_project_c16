import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:flutter/material.dart';

class DetailsHeader extends StatelessWidget {
  final MovieDetailsEntity movie;

  const DetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie.poster??"",
          width: double.infinity,
          height: 450,
          fit: BoxFit.cover,
        ),

        Container(
          height: 450,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.9),
              ],
            ),
          ),
        ),

        Positioned(
          top: 50,
          left: 10,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),

        Positioned(
          top: 50,
          right: 10,
          child: const Icon(Icons.bookmark_border, color: Colors.white, size: 28),
        ),

        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.play_arrow, size: 40, color: Colors.orange),
            ),
          ),
        ),

        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                movie.year.toString(),
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                height: 45,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text("Watch", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
