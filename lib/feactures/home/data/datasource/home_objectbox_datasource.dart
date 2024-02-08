import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';

abstract class HomeObjectBoxDataSource {
  void addMovies(List<HomeObjectEntityModel> entityModel);
  List<HomeObjectEntityModel> getAllMovies();
  void clearAll();
}
