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
import 'package:final_route_projcet_c16/features/main/home/data/data_sources/movies_local_data_source.dart'
    as _i31;
import 'package:final_route_projcet_c16/features/main/home/data/data_sources/movies_remote_data_source.dart'
    as _i40;
import 'package:final_route_projcet_c16/features/main/home/data/repositories_implemantation/movies_repo_imp.dart'
    as _i488;
import 'package:final_route_projcet_c16/features/main/home/domain/repositories_interface/local_movies_repo.dart'
    as _i184;
import 'package:final_route_projcet_c16/features/main/home/domain/repositories_interface/remote_movies_repo.dart'
    as _i746;
import 'package:final_route_projcet_c16/features/main/home/domain/use_cases/get_movies_usecase.dart'
    as _i645;
import 'package:final_route_projcet_c16/features/main/home/presentation/view_model/bloc/home_bloc.dart'
    as _i232;
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
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i1059.BrowseRemoteDS>(() => _i330.BrowserRemoteDSImpl());
    gh.lazySingleton<_i184.HomeLocalDataSource>(
      () => _i31.HomeLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i759.ApiClient>(() => _i759.ApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i40.MoviesRemoteDataSource>(
      () => _i40.MoviesRemoteDataSourceImpl(gh<_i759.ApiClient>()),
    );
    gh.lazySingleton<_i798.SearchRemoteDataSource>(
      () => _i239.SearchRemoteDataSourceImpl(gh<_i759.ApiClient>()),
    );
    gh.lazySingleton<_i945.SearchRepo>(
      () => _i29.SearchRepoImpl(gh<_i798.SearchRemoteDataSource>()),
    );
    gh.lazySingleton<_i858.BrowserRepo>(
      () => _i380.BrowserRepoImpl(gh<_i1059.BrowseRemoteDS>()),
    );
    gh.lazySingleton<_i746.MoviesRepository>(
      () => _i488.MoviesRepositoryImpl(gh<_i40.MoviesRemoteDataSource>()),
    );
    gh.factory<_i645.GetMoviesUseCase>(
      () => _i645.GetMoviesUseCase(gh<_i746.MoviesRepository>()),
    );
    gh.factory<_i147.BrowseMoviesUseCase>(
      () => _i147.BrowseMoviesUseCase(gh<_i858.BrowserRepo>()),
    );
    gh.factory<_i322.SearchMoviesUseCase>(
      () => _i322.SearchMoviesUseCase(gh<_i945.SearchRepo>()),
    );
    gh.factory<_i232.MoviesBloc>(
      () => _i232.MoviesBloc(
        gh<_i645.GetMoviesUseCase>(),
        gh<_i184.HomeLocalDataSource>(),
      ),
    );
    gh.factory<_i465.BrowseBloc>(
      () => _i465.BrowseBloc(gh<_i147.BrowseMoviesUseCase>()),
    );
    gh.factory<_i659.SearchBloc>(
      () => _i659.SearchBloc(gh<_i322.SearchMoviesUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i410.RegisterModule {}
