import 'package:final_route_projcet_c16/features/browser/data/data_sources/browse_remote_ds.dart';
import 'package:final_route_projcet_c16/features/browser/domain/repositories_interface/browser_repo.dart';
import 'package:final_route_projcet_c16/features/search/domain/entities/movie.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BrowserRepo)
class BrowserRepoImpl extends BrowserRepo{
  final BrowseRemoteDS dataSource;
  BrowserRepoImpl(this.dataSource);

  @override
  Future<List<Movie>> getMovies() {
    return dataSource.getMovies();
  }
}