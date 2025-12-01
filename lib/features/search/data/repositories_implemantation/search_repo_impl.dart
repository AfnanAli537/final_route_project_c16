import 'package:final_route_projcet_c16/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:final_route_projcet_c16/features/search/domain/entities/movie.dart';
import 'package:final_route_projcet_c16/features/search/domain/repositories_interface/search_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRepo)
class SearchRepoImpl implements SearchRepo{
  final SearchRemoteDataSource remote;

  SearchRepoImpl(this.remote);

  @override
  Future<List<Movie>> searchMovies(String query) async {
    return await remote.searchMovies(query);
  }
}