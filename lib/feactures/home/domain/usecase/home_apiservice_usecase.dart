import 'package:cinemixe/core/exceptions/home/home_apiservice_exception.dart';
import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe/feactures/home/domain/repositories/home_repository.dart';

final class GetMoviesUseCase {
  final HomeApiServiceRepository repository;
  GetMoviesUseCase({required this.repository});

  Future<List<HomeApiServiceEntity>> call() async {
    try {
      return await repository.getMovies();
    } catch (e) {
      throw  GetMovieException("Error While Fetching Movies");
    }
  }
}