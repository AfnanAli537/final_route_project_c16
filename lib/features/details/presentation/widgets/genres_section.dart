import 'package:flutter/material.dart';

class GenresSection extends StatelessWidget {
  final List<String> genres;

  const GenresSection({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Genres",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: genres.map((g) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff1D1D1D),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  g,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
