import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';

abstract class HomeObjectBoxRepository {
  void addMovies(List<HomeApiServiceEntity> entity);
  List<HomeApiServiceEntity> getAllMovies();
  void clearAll();
}
