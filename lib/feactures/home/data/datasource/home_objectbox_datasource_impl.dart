import 'package:cinemixe_app/core/contants/home/home_apiservice_constants.dart';
import 'package:cinemixe_app/core/objectbox/home_movie_objectbox.dart';
// import 'package:cinemixe_app/core/objectbox/home_popular_object.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_objectbox_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';
// import 'package:cinemixe_app/feactures/home/data/models/home_popular_objectbox_entity_model.dart';
// import 'package:cinemixe_app/feactures/home/data/models/home_toprated_objectbox_entity_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'home_objectbox_datasource_impl.g.dart';

class HomeObjectBoxDatasourceImpl implements HomeObjectBoxDatasource {
  final movieBox = HomeMovieStoreObjectBox.instance.box;

  final imagepath = HomeApiServicetokenConstants().imagePath;
  @override
  void addAllMovies(List<HomeObjectBoxMovieEntity> entity) async {
    final dio = Dio(BaseOptions(baseUrl: imagepath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.poster_path}';
      final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

      await dio.download(movie.poster_path!, posterPathLocation);
      await dio.download(movie.backdrop_path!, backdropPathLocation);

      movie.poster_path = posterPathLocation;
      movie.backdrop_path = backdropPathLocation;

      movieBox.put(movie);
    }
  }

  @override
  void clearAllMovies() {
    movieBox.removeAll();
  }

  @override
  List<HomeObjectBoxMovieEntity> getAllMovies() {
    return movieBox.getAll();
  }

  // @override
  // void addPopularMovies(List<HomePopularEntity> entity) async {
  //     final dio = Dio(BaseOptions(baseUrl: imagepath));
  //   final cacheDirectory =
  //       '${(await getApplicationDocumentsDirectory()).path}/cahced_images';

  //   for (final movie in entity) {
  //     final posterPathLocation = '$cacheDirectory${movie.poster_path}';
  //     final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

  //     await dio.download(movie.poster_path!, posterPathLocation);
  //     await dio.download(movie.backdrop_path!, backdropPathLocation);

  //     movie.poster_path = posterPathLocation;
  //     movie.backdrop_path = backdropPathLocation;

  //     popularBox.put(movie);
  //   }
  // }

  // @override
  // void addTopRatedMovies(List<HomeTopMoviesEntity> entity) async {
  //    final dio = Dio(BaseOptions(baseUrl: imagepath));
  //   final cacheDirectory =
  //       '${(await getApplicationDocumentsDirectory()).path}/cahced_images';

  //   for (final movie in entity) {
  //     final posterPathLocation = '$cacheDirectory${movie.poster_path}';
  //     final backdropPathLocation = '$cacheDirectory${movie.backdrop_path}';

  //     await dio.download(movie.poster_path!, posterPathLocation);
  //     await dio.download(movie.backdrop_path!, backdropPathLocation);

  //     movie.poster_path = posterPathLocation;
  //     movie.backdrop_path = backdropPathLocation;

  //     topRatedBox.put(movie);
  //   }
  // }

  @override
  void clearPopularMovies() {
    movieBox.removeAll();
  }

  @override
  void clearTopRatedMovies() {
    movieBox.removeAll();
  }

  // @override
  // Future<List<HomePopularEntity>> getPopularMovies() async {
  //   return PopularObjectBox.getAll();
  // }

//   @override
//   Future<List<HomeTopMoviesEntity>> getTopRatedMovies() async {}
}

@riverpod
HomeObjectBoxDatasource homeObjectboxDatasource(
    HomeObjectboxDatasourceRef ref) {
  return HomeObjectBoxDatasourceImpl();
}
