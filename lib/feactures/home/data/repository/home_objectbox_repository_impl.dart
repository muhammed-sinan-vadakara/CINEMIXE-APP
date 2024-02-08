import 'package:cinemixe_app/feactures/home/data/datasource/home_objectbox_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_objectbox_datasource_impl.dart';
import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_objectbox_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_objectbox_repository_impl.g.dart';

class HomeObjectBoxRepositoryImpl implements HomeObjectBoxRepository {
  final HomeObjectBoxDataSource dataSource;
  HomeObjectBoxRepositoryImpl({required this.dataSource});

  @override
  void addMovies(List<HomeApiServiceEntity> entity) {
    final List<HomeApiServiceEntity> moviesToAdd = [];
    for (final mov in entity) {
      final entityModel = HomeObjectEntityModel(
          movieId: mov.id,
          originalTitle: mov.originalTitle,
          overview: mov.overview,
          posterPath: mov.posterPath,
          backdropPath: mov.backdropPath,
          title: mov.title,
          voteAverage: mov.voteAverage,
          releaseDate: mov.releaseDate.toString());
      moviesToAdd.add(entityModel as HomeApiServiceEntity);
    }
    dataSource.addMovies(moviesToAdd.cast<HomeObjectEntityModel>());
  }

  @override
  List<HomeApiServiceEntity> getAllMovies() {
    final data = dataSource.getAllMovies();
    return [
      for (final model in data)
        HomeApiServiceEntity(
            id: model.movieId ?? '',
            originalTitle: model.originalTitle ?? '',
            overview: model.overview ?? '',
            posterPath: model.posterPath ?? '',
            backdropPath: model.backdropPath ?? '',
            title: model.title ?? '',
            voteAverage: model.voteAverage ?? 0,
            releaseDate:
                DateTime.tryParse(model.releaseDate ?? '') ?? DateTime.now())
    ];
  }

  @override
  void clearAll() {
    dataSource.clearAll();
  }
}

@riverpod
HomeObjectBoxRepository objRepository(ObjRepositoryRef ref) {
  return HomeObjectBoxRepositoryImpl(dataSource: ref.watch(objDataSourceProvider));
}