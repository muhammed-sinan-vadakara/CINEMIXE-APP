import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';

abstract class HomeApiServiceRepository {
  Future<List<HomeApiServiceEntity>> getMovies();
}
