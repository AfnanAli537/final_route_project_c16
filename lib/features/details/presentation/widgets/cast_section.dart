import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:flutter/material.dart';

class CastSection extends StatelessWidget {
  final List<Cast> cast;

  const CastSection({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Converting to vertical ListView
          SizedBox(
            height: 300, // adjust height as needed
            child: ListView.builder(
              itemCount: cast.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final actor = cast[index];
             
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff1D1D1D),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          actor.profileImage,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Name: ${actor.name}\nCharacter: ${actor.character}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
