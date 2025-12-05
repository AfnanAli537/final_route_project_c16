import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class GenereSection extends StatefulWidget {
 final BuildContext context;
 final String title;
 final  List<Movie>? movies;
  const GenereSection({
  super.key,
  required this.context,
  required this.title,
  required this.movies,
});

  @override
  State<GenereSection> createState() => _GenereSectionState();
}

class _GenereSectionState extends State<GenereSection> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Text("See More", style: TextStyle(color: Colors.orange, fontSize: 16)),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward, size: 16, color: Colors.orange),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies?.length ?? 0,

            itemBuilder: (context, index) {
              final movie = widget.movies![index];
              return MovieCard(
                  ratingText: movie.rating.toString(),
                  imageNetwork: movie.image??"");
            },
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  
  }
}