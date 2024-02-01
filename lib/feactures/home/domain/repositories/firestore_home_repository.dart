
import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';

abstract class FireStoreRepository {
  Future<void> addtofirestore(HomeApiServiceEntity entity);
  Future<void> deleteFromFireStore(String id);
  Stream<List<HomeApiServiceEntity>> getAllMovies();
}