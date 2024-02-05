import 'package:cinemixe_app/feactures/home/data/datasource/firestore_home_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/models/firestore_home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_home_datasource_impl.g.dart';

class FirestoreHomeDatasourceImpl implements FirestoreHomeDatasource {
  final collection = FirebaseFirestore.instance
      .collection("favourite_movie")
      .withConverter(
          fromFirestore: FirestoreHomeModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Stream<QuerySnapshot<FirestoreHomeModel>> getAllMovies() {
    return collection.snapshots();
  }

  @override
  Future<void> addToFireStore(FirestoreHomeModel model) async {
    await collection.doc(model.id).set(model);
  }

  @override
  Future<void> deleteFromFirestore(String id) async {
    await collection.doc(id).delete();
  }

  @override
  Future<List<FirestoreHomeModel>> getByMovieIdFromFireStore(
      String movieId) async {
    final docs = await collection.where('id', isEqualTo: movieId).get();

    final List<FirestoreHomeModel> movies = [];
    for (final movie in docs.docs) {
      movies.add(movie.data());
    }

    return movies;
  }
}

@riverpod
FirestoreHomeDatasource firestoreHomeDatasource(
    FirestoreHomeDatasourceRef ref) {
  return FirestoreHomeDatasourceImpl();
}
