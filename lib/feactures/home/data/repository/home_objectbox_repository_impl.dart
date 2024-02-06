import 'package:cinemixe_app/feactures/home/data/datasource/home_objectbox_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_objectbox_datasource_impl.dart';
import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_objectbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_objectbox_repository_impl.g.dart';

class HomeObjectBoxMovieRepositoryImpl implements HomeObjectBoxMovieRepository {
  final HomeObjectBoxDatasource datasource;
  HomeObjectBoxMovieRepositoryImpl({required this.datasource});
  @override
  void addAllmovies(List<HomeApiServiceEntity> entity) {
    final moviemodel = [
      for (final movie in entity)
        HomeObjectBoxMovieEntity(
            title: movie.title,
            movieId: movie.id.toString(),
            backdrop_path: movie.backdropPath,
            originalLanguage: movie.originalTitle,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            poster_path: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount)
    ];
    datasource.addAllMovies(moviemodel);
  }

  @override
  void clearAllMovies() {
    datasource.clearAllMovies();
  }

  @override
  List<HomeApiServiceEntity> getAllmovies() {
    final models = datasource.getAllMovies();
    return [
      for (final moviemodels in models)
        HomeApiServiceEntity(
            title: moviemodels.title ?? '',
            id: moviemodels.id.toString(),
            overview: moviemodels.overview ?? '',
            backdrop_path: moviemodels.backdrop_path ?? '',
            poster_path: moviemodels.poster_path ?? '',
            releaseDate: moviemodels.releaseDate!,
            voteAverage: moviemodels.voteAverage ?? 0,
            originalTitle: moviemodels.originalTitle ?? '',
            originalLanguage: moviemodels.originalLanguage ?? '',
            voteCount: moviemodels.voteCount!,
            posterPath: moviemodels.poster_path!,
            backdropPath: moviemodels.backdrop_path!,
            posterpath: moviemodels.poster_path!)
    ];
  }

  // @override
  // void addPopularMovies(List<HomeApiServiceEntity> entity) {
  //   final moviemodel = [
  //     for (final movie in entity)
  //       PopularEntity(
  //           title: movie.title,
  //           movieId: movie.id,
  //           backdrop_path: movie.backdrop_path,
  //           originalLanguage: movie.originalLanguage,
  //           originalTitle: movie.originalTitle,
  //           overview: movie.overview,
  //           poster_path: movie.poster_path,
  //           releaseDate: movie.releaseDate,
  //           voteAverage: movie.voteAverage,
  //           voteCount: movie.voteCount)
  //   ];
  //   datasource.addPopularMovies(moviemodel);
  // }

  // @override
  // void addTopRatedmovies(List<HomeApiServiceEntity> entity) {
  //   final moviemodel = [
  //     for (final movie in entity)
  //       TopMoviesEntity(
  //           title: movie.title,
  //           movieId: movie.id,
  //           backdrop_path: movie.backdrop_path,
  //           originalLanguage: movie.originalLanguage,
  //           originalTitle: movie.originalTitle,
  //           overview: movie.overview,
  //           poster_path: movie.poster_path,
  //           releaseDate: movie.releaseDate,
  //           voteAverage: movie.voteAverage,
  //           voteCount: movie.voteCount)
  //   ];
  //   datasource.addTopRatedMovies(moviemodel);
  // }

  @override
  void clearPopularMovies() {
    datasource.clearPopularMovies();
  }

  @override
  void clearTopRatedMovies() {
    datasource.clearTopRatedMovies();
  }

  // @override
  // List<HomeApiServiceEntity> getPopularMovies() {
  //   final models = datasource.getPopularMovies();
  //   return [
  //     for (final moviemodels in models)
  //       HomeObjectBoxMovieEntity(
  //           title: moviemodels.title ?? '',
  //           id: moviemodels.id,
  //           overview: moviemodels.overview ?? '',
  //           backdrop_path: moviemodels.backdrop_path ?? '',
  //           poster_path: moviemodels.poster_path ?? '',
  //           releaseDate: moviemodels.releaseDate!,
  //           voteAverage: moviemodels.voteAverage ?? 0,
  //           originalTitle: moviemodels.originalTitle ?? '',
  //           originalLanguage: moviemodels.originalLanguage ?? '',
  //           voteCount: moviemodels.voteCount!)
  //   ];
  // }

  // @override
  // List<HomeApiServiceEntity> getTopRatedMovies() {
  //   final models = datasource.getTopRatedMovies();
  //   return [
  //     for (final moviemodels in models)
  //       HomeApiServiceEntity(
  //           title: moviemodels.title ?? '',
  //           id: moviemodels.id,
  //           overview: moviemodels.overview ?? '',
  //           backdrop_path: moviemodels.backdrop_path ?? '',
  //           posterpath: moviemodels.poster_path ?? '',
  //           releaseDate: moviemodels.releaseDate!,
  //           voteAverage: moviemodels.voteAverage ?? 0,
  //           originalTitle: moviemodels.originalTitle ?? '',
  //           originalLanguage: moviemodels.originalLanguage ?? '',
  //           voteCount: moviemodels.voteCount!)
  //   ];
  // }
}

@riverpod
HomeObjectBoxMovieRepository homeObjectBoxMovieRepository(
    HomeObjectBoxMovieRepositoryRef ref) {
  return HomeObjectBoxMovieRepositoryImpl(
      datasource: ref.watch(homeObjectboxDatasourceProvider));
}
