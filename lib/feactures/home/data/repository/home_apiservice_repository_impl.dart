import 'package:cinemixe_app/feactures/home/data/datasource/home_apiservice_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_apiservice_datasource_impl.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_apiservice_repository_impl.g.dart';

class HomeApiServiceRepositoryImpl implements HomeApiServiceRepository {
  final HomeApiServiceDataSource dataSource;
  HomeApiServiceRepositoryImpl({required this.dataSource});

  @override
  Future<List<HomeApiServiceEntity>> getMovies() async {
    final datas = await dataSource.getMovies();

    late List<HomeApiServiceEntity> results;
    results = [
      for (final result in datas.results)
        HomeApiServiceEntity(
          id: result.id.toString(),
          originalTitle: result.originalTitle ?? "",
          overview: result.overview ?? "",
          posterPath: result.posterPath ?? "",
          backdropPath: result.backdropPath ?? "",
          title: result.title ?? "",
          voteAverage: result.voteAverage ?? 0,
          releaseDate:
              DateTime.tryParse(result.releaseDate ?? '') ?? DateTime.now(),
        )
    ];
    return results;
  }

  @override
  Future<List<HomeApiServiceEntity>> searchMovies(String text) async {
    final data = await dataSource.searchMovies(text);
    late List<HomeApiServiceEntity> results;
    results = [
      for (final result in data.results)
        HomeApiServiceEntity(
          id: result.id.toString(),
          originalTitle: result.originalTitle ?? "",
          overview: result.overview ?? "",
          posterPath: result.posterPath ?? "",
          backdropPath: result.backdropPath ?? "",
          title: result.title ?? "",
          voteAverage: result.voteAverage ?? 0,
          releaseDate:
              DateTime.tryParse(result.releaseDate ?? '') ?? DateTime.now(),
        )
    ];
    return results;
  }

  @override
  Future<List<HomeApiServiceEntity>> topRated() async {
    final data = await dataSource.topRated();

    late List<HomeApiServiceEntity> results;
    results = [
      for (final result in data.results)
        HomeApiServiceEntity(
          id: result.id.toString(),
          originalTitle: result.originalTitle ?? "",
          backdropPath: result.backdropPath ?? "",
          overview: result.overview ?? "",
          posterPath: result.posterPath ?? "",
          title: result.title ?? "",
          voteAverage: result.voteAverage ?? 0,
          releaseDate:
              DateTime.tryParse(result.releaseDate ?? "") ?? DateTime.now(),
        )
    ];
    return results;
  }
}

@riverpod
HomeApiServiceRepository homeApiServiceRepository(
    HomeApiServiceRepositoryRef ref) {
  return HomeApiServiceRepositoryImpl(
      dataSource: ref.watch(homeApiServiceDataSourceProvider));
}
