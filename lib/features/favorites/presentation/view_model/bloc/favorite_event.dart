import 'package:final_route_projcet_c16/features/favorites/data/models/favorite_models.dart';

abstract class FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final FavoriteModel model;

  AddFavoriteEvent(this.model);
}

class LoadFavoritesEvent extends FavoriteEvent {}

class CheckFavoriteEvent extends FavoriteEvent {
  final String movieId;

  CheckFavoriteEvent(this.movieId);
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final String movieId;

  RemoveFavoriteEvent(this.movieId);
}
