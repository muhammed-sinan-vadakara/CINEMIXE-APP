import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/core/utils/network_utils.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_objectbox_repository.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';

final class MovieUsecase {
  final HomeObjectBoxMovieRepository localrepo;
  final HomeApiServiceRepository repository;
  MovieUsecase({required this.repository, required this.localrepo});
  Future<List<HomeApiServiceEntity>> call() async {
    bool result = await NetworkUtils.hasNetwork();
    try {
      if (result) {
        final datafromApi = await repository.getMovies();
        localrepo.clearAllMovies();
        localrepo.addAllmovies(datafromApi);
        return datafromApi;
      } else {
        final datafromlocal = localrepo.getAllmovies();
        return datafromlocal;
      }
    } catch (e) {
      throw BaseException('Error while fetching');
    }
  }
}
