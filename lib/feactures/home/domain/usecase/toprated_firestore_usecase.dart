import 'package:cinemixe_app/core/exceptions/home/home_apiservice_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';

final class TopRatedUseCase {
  final HomeApiServiceRepository repository;
  TopRatedUseCase({required this.repository});

  Future<List<HomeApiServiceEntity>> call() async {
    try {
      return await repository.topRated();
    } catch (e) {
      throw GetMovieException("Error While FEtching Movies");
    }
  }
}
