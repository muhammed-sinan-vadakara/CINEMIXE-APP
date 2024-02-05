import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';

abstract class HomeApiServiceRepository {
  Future<List<HomeApiServiceEntity>> getMovies();
  Future<List<HomeApiServiceEntity>> topRated();
  Future<List<HomeApiServiceEntity>> searchMovies(String text);
}
