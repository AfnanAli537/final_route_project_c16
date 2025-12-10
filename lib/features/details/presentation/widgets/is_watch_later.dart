import 'package:final_route_projcet_c16/features/favorites/data/models/favorite_models.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_bloc.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_event.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_state.dart';
import 'package:final_route_projcet_c16/features/update_profile/presentation/widgets/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key, required this.movie, this.onChanged});

  final VoidCallback? onChanged;
  final FavoriteModel movie;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmarked = false;
  bool isLoading = false;

  void _toggleFavorite() {
    final bloc = context.read<FavoriteBloc>();
    setState(() => isLoading = true);

    if (!isBookmarked) {
      bloc.add(AddFavoriteEvent(widget.movie));
    } else {
      bloc.add(RemoveFavoriteEvent(widget.movie.movieId));
    }
  }

  @override
  void initState() {
    super.initState();
    final bloc = context.read<FavoriteBloc>();
    bloc.add(CheckFavoriteEvent(widget.movie.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteAdded) {
          setState(() {
            isBookmarked = true;
            isLoading = false;
          });
          widget.onChanged?.call();
          showCustomSnackBar(context, state.message, true);
        }
        else if (state is FavoriteRemoved) {
          setState(() {
            isBookmarked = false;
            isLoading = false;
          });
          widget.onChanged?.call();
          showCustomSnackBar(context, state.message, false);
        } else if (state is FavoriteStatusChecked) {
          setState(() {
            isBookmarked = state.isFavorite;
            isLoading = false;
          });
        } else if (state is FavoriteError) {
          setState(() => isLoading = false);
          showCustomSnackBar(context, state.message, false);
        }
      },
      child: GestureDetector(
        onTap: isLoading ? null : _toggleFavorite,
        child: Icon(
          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
