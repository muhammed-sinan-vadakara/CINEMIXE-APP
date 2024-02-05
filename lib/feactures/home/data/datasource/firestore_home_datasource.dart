import 'package:cinemixe_app/feactures/home/data/models/firestore_home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreHomeDatasource {
  Future<void> addToFireStore(FirestoreHomeModel model);
  Future<void> deleteFromFirestore(String id);
  Future<List<FirestoreHomeModel>> getByMovieIdFromFireStore(String movieId);
  Stream<QuerySnapshot<FirestoreHomeModel>> getAllMovies();
}
