import 'package:cinemixe_app/core/exceptions/home/home_apiservice_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_objectbox_repository.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';

final class GetMoviesUseCase {
  final HomeApiServiceRepository repository;
  GetMoviesUseCase({required this.repository, required HomeObjectBoxMovieRepository objectRepository});

  Future<List<HomeApiServiceEntity>> call() async {
    try {
      return await repository.getMovies();
    } catch (e) {
      throw GetMovieException("Error While FEtching Movies");
    }
  }
}
