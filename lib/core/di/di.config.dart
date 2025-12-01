// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/network/network_config.dart';
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

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<Dio>(() => Dio(
      BaseOptions(baseUrl: NetworkConfig.baseUrl),
    ));

    gh.lazySingleton<_i1059.BrowseRemoteDS>(() => _i330.BrowserRemoteDSImpl());
    gh.lazySingleton<_i798.SearchRemoteDataSource>(
      () => _i239.SearchRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i945.SearchRepo>(
      () => _i29.SearchRepoImpl(gh<_i798.SearchRemoteDataSource>()),
    );
    gh.lazySingleton<_i858.BrowserRepo>(
      () => _i380.BrowserRepoImpl(gh<_i1059.BrowseRemoteDS>()),
    );
    gh.factory<_i147.BrowseMoviesUseCase>(
      () => _i147.BrowseMoviesUseCase(gh<_i858.BrowserRepo>()),
    );
    gh.factory<_i322.SearchMoviesUseCase>(
      () => _i322.SearchMoviesUseCase(gh<_i945.SearchRepo>()),
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
