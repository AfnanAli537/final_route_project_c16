import 'package:final_route_projcet_c16/core/constants/assets_manager.dart';
import 'package:flutter/material.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(ImageAssets.emptySearch))
      ],
    );
  }
}
