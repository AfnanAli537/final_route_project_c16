import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_bloc.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_event.dart';
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_route_projcet_c16/core/widgets/movie_card.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HistoryLoaded) {
          final history = state.history;
          if (history.isEmpty) {
            return Center(
              child: Text(
                "No movies in History",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<HistoryBloc>().add(LoadHistory());
            },
            child: GridView.builder(
              padding: EdgeInsets.all(12.w),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
                return MovieCard(
                  ratingText: item['rating']!,
                  imageNetwork: item['image']!,
                  movie: int.tryParse(item['id']!),
                );
              },
            ),
          );
        } else if (state is HistoryError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
