import 'package:cinemixe/feactures/home/data/datasource/home_apiservice_datasource.dart';
import 'package:cinemixe/feactures/home/data/datasource/home_apiservice_datasource_impl.dart';
import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe/feactures/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_apiservice_repository_impl.g.dart';

class HomeApiServiceRepositoryImpl implements HomeApiServiceRepository {
   final HomeApiServiceDataSource dataSource;
  HomeApiServiceRepositoryImpl({required this.dataSource});

  @override
  Future<List<HomeApiServiceEntity>> getMovies() async {
    final data = await dataSource.getMovies();

    late List<HomeApiServiceEntity> results;
    results = [
      for (final result in data.results)
        HomeApiServiceEntity(
            originalTitle: result.originalTitle,
            overview: result.overview,
            posterPath: result.posterPath,
            title: result.title,
            voteAverage: result.voteAverage
            )
    ];
    return results;
  }
}


@riverpod
HomeApiServiceRepository homeApiServiceRepository(HomeApiServiceRepositoryRef ref){
  return HomeApiServiceRepositoryImpl(dataSource: ref.watch(homeApiServiceDataSourceProvider));
}
