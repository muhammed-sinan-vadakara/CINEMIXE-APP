import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';

final class CheckFavariteMoviesUsecase {
  CheckFavariteMoviesUsecase();

  bool call(String movieId, List<HomeApiServiceEntity> allFavMovies) {
    for (final movie in allFavMovies) {
      if (movie.id == movieId) {
        return true;
      }
    }
    return false;
  }
}
