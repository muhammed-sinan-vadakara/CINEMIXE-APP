import 'package:cinemixe_app/core/contants/home/home_apiservice_constants.dart';
import 'package:cinemixe_app/core/objectbox/movie_objectbox.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_objectbox_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_objectbox_datasource_impl.g.dart';

class HomeObjectBoxDataSourceImpl implements HomeObjectBoxDataSource {
  final box = MovieObjectBox.instance.movieBox;

  @override
  void addMovies(List<HomeObjectEntityModel> entityModel) async {
    final dio =
        Dio(BaseOptions(baseUrl: HomeApiServicetokenConstants().imagePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';
    for (final movie in entityModel) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$cacheDirectory${movie.backdropPath}';
      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);
      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;
    }
    box.putMany(entityModel);
  }

  @override
  List<HomeObjectEntityModel> getAllMovies() {
    return box.getAll();
  }

  @override
  void clearAll() {
    box.removeAll();
  }
}

@riverpod
HomeObjectBoxDataSource objDataSource(ObjDataSourceRef ref) {
  return HomeObjectBoxDataSourceImpl();
}
