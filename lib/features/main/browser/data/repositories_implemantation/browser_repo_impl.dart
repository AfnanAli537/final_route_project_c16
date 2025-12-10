import 'package:final_route_projcet_c16/features/main/browser/data/data_sources/browse_remote_ds.dart';
import 'package:final_route_projcet_c16/features/main/browser/domain/repositories_interface/browser_repo.dart';
import 'package:final_route_projcet_c16/features/main/search/domain/entities/movie.dart';
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