import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';

final class SearchMovieUseCase {
  final HomeApiServiceRepository repository;
  SearchMovieUseCase({required this.repository});

  Future<List<HomeApiServiceEntity>> call(String text) async {
    try {
      return await repository.searchMovies(text);
    } catch (e) {
      throw BaseException('Failed to load Movies');
    }
  }
}
