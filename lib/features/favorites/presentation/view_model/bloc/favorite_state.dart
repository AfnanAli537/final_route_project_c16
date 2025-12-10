import '../../../data/models/favorite_models.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteAdded extends FavoriteState {
  final String message;

  FavoriteAdded(this.message);
}

class FavoritesLoaded extends FavoriteState {
  final List<FavoriteModel> items;

  FavoritesLoaded(this.items);
}

class FavoriteStatusChecked extends FavoriteState {
  final bool isFavorite;

  FavoriteStatusChecked(this.isFavorite);
}

class FavoriteRemoved extends FavoriteState {
  final String message;

  FavoriteRemoved(this.message);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}
