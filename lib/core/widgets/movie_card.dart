import 'package:final_route_projcet_c16/core/constants/color_manager.dart';
import 'package:final_route_projcet_c16/core/routes/app_routes.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_bloc.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.ratingText,
    required this.imageNetwork,
    this.movie,
    this.onRefresh,
  });

  final int? movie;
  final String ratingText;
  final String imageNetwork;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<HistoryBloc>().add(
          AddHistoryItem(
            "movie.title",
            imageNetwork,
            ratingText,
            "$movie",
          ),
        );
        Navigator.pushNamed(
          context,
          AppRoutes.details,
          arguments: movie?.toInt() ?? 0,
        );
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(imageNetwork, fit: BoxFit.fill),
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 7, vertical: 5),
            margin: REdgeInsets.symmetric(horizontal: 11, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorManager.border.withOpacity(0.7),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4.sp,
              children: [
                Text(ratingText, style: Theme.of(context).textTheme.bodyLarge),
                Icon(Icons.star, color: ColorManager.secondary, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
