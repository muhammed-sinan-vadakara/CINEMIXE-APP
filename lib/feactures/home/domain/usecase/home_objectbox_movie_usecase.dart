
import 'package:cinemixe_app/core/exceptions/home/home_apiservice_exception.dart';
import 'package:cinemixe_app/core/utils/network_utils.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_objectbox_repository.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';

final class GetMoviesUseCase {
  final HomeApiServiceRepository repository;
  final HomeObjectBoxRepository objRepository;
  GetMoviesUseCase({required this.repository, required this.objRepository});

  Future<List<HomeApiServiceEntity>> call() async {
    try {
      if (await NetworkUtils.hasNetwork()) {
        final data = await repository.getMovies();
        objRepository.clearAll();
        objRepository.addMovies(data);
        return data;
      } else {
        final dataFromLocal = objRepository.getAllMovies();
        return dataFromLocal;
      }
    } catch (e) {
      throw GetMovieException("Error While Fetching Movies");
    }
  }
}






// import 'package:cinemixe_app/core/exceptions/base_exception.dart';
// import 'package:cinemixe_app/core/utils/network_utils.dart';
// import 'package:cinemixe_app/feactures/home/data/repository/home_objectbox_repository_impl.dart';
// import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
// import 'package:cinemixe_app/feactures/home/domain/repositories/home_objectbox_repository.dart';
// import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';

// final class MovieUsecase {
//   final ObjRepositoryRef localrepo;
//   final HomeApiServiceRepository repository;
//   MovieUsecase({required this.repository, required this.localrepo, required HomeObjectBoxMovieRepository objectRepository});
//   Future<List<HomeApiServiceEntity>> call() async {
//     bool result = await NetworkUtils.hasNetwork();
//     try {
//       if (result) {
//         final datafromApi = await repository.getMovies();
//         localrepo.clearAllMovies();
//         localrepo.addAllmovies(datafromApi);
//         return datafromApi;
//       } else {
//         final datafromlocal = localrepo.getAllmovies();
//         return datafromlocal;
//       }
//     } catch (e) {
//       throw BaseException('Error while fetching');
//     }
//   }
// }
