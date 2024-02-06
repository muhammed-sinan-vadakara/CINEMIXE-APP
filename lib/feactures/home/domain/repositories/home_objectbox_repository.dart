import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';

abstract class HomeObjectBoxMovieRepository {
  void addAllmovies(List<HomeApiServiceEntity> entity);
  void clearAllMovies();
  List<HomeApiServiceEntity> getAllmovies();
  // void addTopRatedmovies(List<HomeApiServiceEntity> entity);
  void clearTopRatedMovies();
  // List<HomeApiServiceEntity> getTopRatedMovies();
  // void addPopularMovies(List<HomeApiServiceEntity> entity);
  void clearPopularMovies();
  // List<HomeApiServiceEntity> getPopularMovies();
}
