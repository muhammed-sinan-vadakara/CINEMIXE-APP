import 'package:cinemixe/feactures/home/data/models/home_apiservice_model.dart';

abstract class HomeApiServiceDataSource {
  Future<HomeApiServiceModel> getMovies();
}
