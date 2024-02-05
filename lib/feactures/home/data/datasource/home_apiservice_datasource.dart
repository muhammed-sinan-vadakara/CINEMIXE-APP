import 'package:cinemixe_app/feactures/home/data/models/home_apiservice_model.dart';

abstract class HomeApiServiceDataSource {
  Future<HomeApiServiceModel> getMovies();
  Future<HomeApiServiceModel> topRated();
  Future<HomeApiServiceModel> searchMovies(String text);
}
