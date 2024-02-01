import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';

final class CheckFavariteMoviesUsecase {
  CheckFavariteMoviesUsecase(String movieId, List<HomeApiServiceEntity> favMovies);

  bool Call(String movieId, List<HomeApiServiceEntity> allFavMovies) {
    for (final movie in allFavMovies) {
      if (movie.id == movieId) {
        return true;
      }
    }
    return false;
  }
}
