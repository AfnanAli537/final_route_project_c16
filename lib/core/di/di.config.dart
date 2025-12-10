// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:final_route_projcet_c16/core/di/external_dep.dart' as _i410;
import 'package:final_route_projcet_c16/core/network/api_client.dart' as _i759;
import 'package:final_route_projcet_c16/features/browser/data/data_sources/browse_remote_ds.dart'
    as _i1059;
import 'package:final_route_projcet_c16/features/browser/data/data_sources/browser_remote_ds_impl.dart'
    as _i330;
import 'package:final_route_projcet_c16/features/browser/data/repositories_implemantation/browser_repo_impl.dart'
    as _i380;
import 'package:final_route_projcet_c16/features/browser/domain/repositories_interface/browser_repo.dart'
    as _i858;
import 'package:final_route_projcet_c16/features/browser/domain/use_cases/browse_movies_usecase.dart'
    as _i147;
import 'package:final_route_projcet_c16/features/browser/presentation/view_model/bloc/browse_bloc.dart'
    as _i465;
import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_details_data_sources.dart'
    as _i198;
import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_details_remote_data_source.dart'
    as _i530;
import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_suggestion_data_sources.dart'
    as _i241;
import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_suggestion_remote_data_sources.dart'
    as _i515;
import 'package:final_route_projcet_c16/features/details/data/repositories_implemantation/details_repo_impl.dart'
    as _i507;
import 'package:final_route_projcet_c16/features/details/data/repositories_implemantation/suggestions_repo_impl.dart'
    as _i463;
import 'package:final_route_projcet_c16/features/details/domain/repositories_interface/details_repo_interface.dart'
    as _i818;
import 'package:final_route_projcet_c16/features/details/domain/repositories_interface/suggestions_repo_interface.dart'
    as _i211;
import 'package:final_route_projcet_c16/features/details/domain/use_cases/movie_details_use_case.dart'
    as _i689;
import 'package:final_route_projcet_c16/features/details/domain/use_cases/movie_suggestions_use_case.dart'
    as _i12;
import 'package:final_route_projcet_c16/features/details/presentation/view_model/details_bloc/movie_details_bloc.dart'
    as _i1028;
import 'package:final_route_projcet_c16/features/details/presentation/view_model/suggestions_bloc/movie_suggestions_bloc.dart'
    as _i709;
import 'package:final_route_projcet_c16/features/favorites/data/data_sources/favorites_remote_ds.dart'
    as _i51;
import 'package:final_route_projcet_c16/features/favorites/data/data_sources/favorites_remote_ds_impl.dart'
    as _i549;
import 'package:final_route_projcet_c16/features/favorites/data/repositories_implementation/favorite_repo_impl.dart'
    as _i516;
import 'package:final_route_projcet_c16/features/favorites/domain/repository_interface/favorite_repo.dart'
    as _i522;
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/add_favorite_use_case.dart'
    as _i809;
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/get_favorite_use_case.dart'
    as _i171;
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/is_favorite_use_case.dart'
    as _i955;
import 'package:final_route_projcet_c16/features/favorites/domain/use_cases/remove_favorite_use_case.dart'
    as _i973;
import 'package:final_route_projcet_c16/features/favorites/presentation/view_model/bloc/favorite_bloc.dart'
    as _i1060;
import 'package:final_route_projcet_c16/features/main/home/data/data_sources/data_sources.dart'
    as _i1033;
import 'package:final_route_projcet_c16/features/main/home/data/data_sources/movies_remote_data_source.dart'
    as _i40;
import 'package:final_route_projcet_c16/features/main/home/data/repositories_implemantation/movies_repo_imp.dart'
    as _i488;
import 'package:final_route_projcet_c16/features/main/home/domain/repositories_interface/remote_movies_repo.dart'
    as _i746;
import 'package:final_route_projcet_c16/features/main/home/domain/use_cases/get_movies_usecase.dart'
    as _i645;
import 'package:final_route_projcet_c16/features/main/home/presentation/view_model/bloc/home_bloc.dart'
    as _i232;
import 'package:final_route_projcet_c16/features/profile/data/data_sources/profile_remote_ds.dart'
    as _i937;
import 'package:final_route_projcet_c16/features/profile/data/data_sources/profile_remote_ds_impl.dart'
    as _i696;
import 'package:final_route_projcet_c16/features/profile/data/repositories_implemantation/profile_repo_impl.dart'
    as _i393;
import 'package:final_route_projcet_c16/features/profile/domain/repositories_interface/profile_repo.dart'
    as _i791;
import 'package:final_route_projcet_c16/features/profile/domain/use_cases/get_profile_use_case.dart'
    as _i392;
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/bloc/profile_bloc.dart'
    as _i646;
import 'package:final_route_projcet_c16/features/profile/presentation/view_model/history/history_bloc.dart'
    as _i765;
import 'package:final_route_projcet_c16/features/search/data/data_sources/search_remote_data_source.dart'
    as _i798;
import 'package:final_route_projcet_c16/features/search/data/data_sources/search_remote_data_source_impl.dart'
    as _i239;
import 'package:final_route_projcet_c16/features/search/data/repositories_implemantation/search_repo_impl.dart'
    as _i29;
import 'package:final_route_projcet_c16/features/search/domain/repositories_interface/search_repo.dart'
    as _i945;
import 'package:final_route_projcet_c16/features/search/domain/use_cases/search_movies_use_case.dart'
    as _i322;
import 'package:final_route_projcet_c16/features/search/presentation/view_model/bloc/search_bloc.dart'
    as _i659;
import 'package:final_route_projcet_c16/features/update_profile/domain/use_cases/delete_profile_use_case.dart'
    as _i95;
import 'package:final_route_projcet_c16/features/update_profile/domain/use_cases/update_profile_use_case.dart'
    as _i89;
import 'package:final_route_projcet_c16/features/update_profile/presentation/view_model/bloc/update_profile_bloc.dart'
    as _i963;
import 'package:final_route_projcet_c16/features/update_profile/reset_password/data/data_sources/reset_password_ds.dart'
    as _i174;
import 'package:final_route_projcet_c16/features/update_profile/reset_password/data/repositories_implemantation/reset_password_repo_impl.dart'
    as _i908;
import 'package:final_route_projcet_c16/features/update_profile/reset_password/domain/repositories_interface/reset_password_repo.dart'
    as _i353;
import 'package:final_route_projcet_c16/features/update_profile/reset_password/domain/use_cases/reset_password_use_case.dart'
    as _i474;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final resetPasswordModule = _$ResetPasswordModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i765.HistoryBloc>(() => _i765.HistoryBloc());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i1059.BrowseRemoteDS>(() => _i330.BrowserRemoteDSImpl());
    gh.lazySingleton<_i51.FavoriteRemoteDs>(
      () => _i549.FavoriteRemoteDsImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i937.ProfileRemoteDs>(
      () => _i696.ProfileRemoteDsImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i759.ApiClient>(() => _i759.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i361.Dio>(
      () => resetPasswordModule.authorizedDio,
      instanceName: 'authorizedDio',
    );
    gh.lazySingleton<_i798.SearchRemoteDataSource>(
      () => _i239.SearchRemoteDataSourceImpl(gh<_i759.ApiClient>()),
    );
    gh.lazySingleton<_i241.SuggestionsDataSource>(
      () => _i515.SuggestionsRemoteDataSourceImpl(gh<_i759.ApiClient>()),
    );
    gh.lazySingleton<_i945.SearchRepo>(
      () => _i29.SearchRepoImpl(gh<_i798.SearchRemoteDataSource>()),
    );
    gh.lazySingleton<_i522.FavoriteRepo>(
      () => _i516.FavoriteRepoImpl(gh<_i51.FavoriteRemoteDs>()),
    );
    gh.lazySingleton<_i791.ProfileRepo>(
      () => _i393.ProfileRepositoryImpl(gh<_i937.ProfileRemoteDs>()),
    );
    gh.factory<_i809.AddFavoriteUseCase>(
      () => _i809.AddFavoriteUseCase(gh<_i522.FavoriteRepo>()),
    );
    gh.factory<_i171.GetFavoritesUseCase>(
      () => _i171.GetFavoritesUseCase(gh<_i522.FavoriteRepo>()),
    );
    gh.factory<_i955.IsFavoriteUseCase>(
      () => _i955.IsFavoriteUseCase(gh<_i522.FavoriteRepo>()),
    );
    gh.factory<_i973.RemoveFavoriteUseCase>(
      () => _i973.RemoveFavoriteUseCase(gh<_i522.FavoriteRepo>()),
    );
    gh.lazySingleton<_i858.BrowserRepo>(
      () => _i380.BrowserRepoImpl(gh<_i1059.BrowseRemoteDS>()),
    );
    gh.factory<_i392.GetProfile>(
      () => _i392.GetProfile(gh<_i791.ProfileRepo>()),
    );
    gh.factory<_i95.DeleteProfile>(
      () => _i95.DeleteProfile(gh<_i791.ProfileRepo>()),
    );
    gh.factory<_i89.UpdateProfileUseCase>(
      () => _i89.UpdateProfileUseCase(gh<_i791.ProfileRepo>()),
    );
    gh.lazySingleton<_i211.SuggestionsRepository>(
      () => _i463.SuggestionsRepositoryImpl(gh<_i241.SuggestionsDataSource>()),
    );
    gh.lazySingleton<_i174.ResetPasswordDs>(
      () => resetPasswordModule.provideResetPasswordDs(
        gh<_i361.Dio>(instanceName: 'authorizedDio'),
      ),
    );
    gh.lazySingleton<_i198.DetailsDataSource>(
      () => _i530.MovieRemoteDataSourceImpl(gh<_i759.ApiClient>()),
    );
    gh.factory<_i12.GetSuggestionsUseCase>(
      () => _i12.GetSuggestionsUseCase(gh<_i211.SuggestionsRepository>()),
    );
    gh.factory<_i646.ProfileBloc>(
      () => _i646.ProfileBloc(gh<_i392.GetProfile>()),
    );
    gh.lazySingleton<_i353.ResetPasswordRepo>(
      () => _i908.ResetPasswordRepoImpl(gh<_i174.ResetPasswordDs>()),
    );
    gh.factory<_i147.BrowseMoviesUseCase>(
      () => _i147.BrowseMoviesUseCase(gh<_i858.BrowserRepo>()),
    );
    gh.factory<_i322.SearchMoviesUseCase>(
      () => _i322.SearchMoviesUseCase(gh<_i945.SearchRepo>()),
    );
    gh.lazySingleton<_i1033.MoviesDataSource>(
      () => _i40.MoviesRemoteDataSource(gh<_i759.ApiClient>()),
    );
    gh.lazySingleton<_i474.ResetPasswordUseCase>(
      () => _i474.ResetPasswordUseCase(gh<_i353.ResetPasswordRepo>()),
    );
    gh.factory<_i963.UpdateProfileBloc>(
      () => _i963.UpdateProfileBloc(
        gh<_i89.UpdateProfileUseCase>(),
        gh<_i95.DeleteProfile>(),
        gh<_i474.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i1060.FavoriteBloc>(
      () => _i1060.FavoriteBloc(
        gh<_i809.AddFavoriteUseCase>(),
        gh<_i171.GetFavoritesUseCase>(),
        gh<_i955.IsFavoriteUseCase>(),
        gh<_i973.RemoveFavoriteUseCase>(),
      ),
    );
    gh.factory<_i709.MovieSuggestionsBloc>(
      () => _i709.MovieSuggestionsBloc(gh<_i12.GetSuggestionsUseCase>()),
    );
    gh.lazySingleton<_i746.MoviesRepository>(
      () => _i488.MoviesRepositoryImpl(gh<_i1033.MoviesDataSource>()),
    );
    gh.factory<_i465.BrowseBloc>(
      () => _i465.BrowseBloc(gh<_i147.BrowseMoviesUseCase>()),
    );
    gh.lazySingleton<_i818.MovieDetailsRepository>(
      () => _i507.MovieDetailsRepositoryImpl(gh<_i198.DetailsDataSource>()),
    );
    gh.factory<_i659.SearchBloc>(
      () => _i659.SearchBloc(gh<_i322.SearchMoviesUseCase>()),
    );
    gh.factory<_i645.GetMoviesUseCase>(
      () => _i645.GetMoviesUseCase(gh<_i746.MoviesRepository>()),
    );
    gh.factory<_i232.MoviesBloc>(
      () => _i232.MoviesBloc(gh<_i645.GetMoviesUseCase>()),
    );
    gh.factory<_i689.MovieDetailsUseCase>(
      () => _i689.MovieDetailsUseCase(gh<_i818.MovieDetailsRepository>()),
    );
    gh.factory<_i1028.MovieDetailsBloc>(
      () => _i1028.MovieDetailsBloc(gh<_i689.MovieDetailsUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i410.RegisterModule {}

class _$ResetPasswordModule extends _i410.ResetPasswordModule {}
