import 'package:bloc/bloc.dart';
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/add_favorite_use_case.dart';
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/get_favorite_use_case.dart';
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/is_favorite_use_case.dart';
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/remove_favorite_use_case.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_event.dart';
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AddFavoriteUseCase addFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final IsFavoriteUseCase isFavoriteUseCase; // ← جديد
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  FavoriteBloc(
    this.addFavoriteUseCase,
    this.getFavoritesUseCase,
    this.isFavoriteUseCase,
    this.removeFavoriteUseCase,
  ) : super(FavoriteInitial()) {

    on<AddFavoriteEvent>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final msg = await addFavoriteUseCase(event.model);
        emit(FavoriteAdded(msg));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<LoadFavoritesEvent>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final list = await getFavoritesUseCase();
        emit(FavoritesLoaded(list));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<CheckFavoriteEvent>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final status = await isFavoriteUseCase(event.movieId);
        emit(FavoriteStatusChecked(status));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<RemoveFavoriteEvent>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final msg = await removeFavoriteUseCase(event.movieId);
        emit(FavoriteRemoved(msg));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });
  }
}
