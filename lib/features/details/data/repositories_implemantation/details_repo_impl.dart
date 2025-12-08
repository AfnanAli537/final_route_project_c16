import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_details_data_sources.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:final_route_projcet_c16/features/details/domain/repositories_interface/details_repo_interface.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final DetailsDataSource remote;
  MovieDetailsRepositoryImpl(this.remote);

  @override
  Future<MovieDetailsEntity> getMovieDetails(int id) async {
    return await remote.getMovieDetails(id);
  }
}