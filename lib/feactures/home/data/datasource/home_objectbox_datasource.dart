import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';
// import 'package:cinemixe_app/feactures/home/data/models/home_popular_objectbox_entity_model.dart';
// import 'package:cinemixe_app/feactures/home/data/models/home_toprated_objectbox_entity_model.dart';

abstract class HomeObjectBoxDatasource {
  void  addAllMovies(List<HomeObjectBoxMovieEntity> entity);
  void clearAllMovies();
  List<HomeObjectBoxMovieEntity> getAllMovies();
  // void addTopRatedMovies(List<HomeTopMoviesEntity> entity);
  void clearTopRatedMovies();
  // List<HomeTopMoviesEntity> getTopRatedMovies();
  // void addPopularMovies(List<HomePopularEntity> entity);
  void clearPopularMovies();
  // List<HomePopularEntity> getPopularMovies();
}
