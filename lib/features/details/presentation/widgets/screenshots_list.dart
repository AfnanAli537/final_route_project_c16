import 'package:flutter/material.dart';

class ScreenshotsList extends StatelessWidget {
  final List<String> images;

  const ScreenshotsList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Screen Shots",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: images.map((img) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(img, height: 150, width: double.infinity, fit: BoxFit.cover),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
