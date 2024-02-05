import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/firestore_home_repository.dart';

final class GetAllMoviesFromFirestoreUseCase {
  final FireStoreRepository repository;
  GetAllMoviesFromFirestoreUseCase({required this.repository});

  Stream<List<HomeApiServiceEntity>> call() {
    try {
      return repository.getAllMovies();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
