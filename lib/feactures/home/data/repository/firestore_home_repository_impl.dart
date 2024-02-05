import 'package:cinemixe_app/feactures/home/data/datasource/firestore_home_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/firestore_home_datasource_impl.dart';
import 'package:cinemixe_app/feactures/home/data/models/firestore_home_model.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/firestore_home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_home_repository_impl.g.dart';

class FirestoreRepositoryImpl implements FireStoreRepository {
  final FirestoreHomeDatasource datasource;
  FirestoreRepositoryImpl({required this.datasource});

  @override
  Future<void> addtofirestore(HomeApiServiceEntity entityclass) async {
    final movieadd = FirestoreHomeModel(
        id: entityclass.id,
        originalTitle: entityclass.originalTitle,
        overview: entityclass.overview,
        posterPath: entityclass.posterPath,
        backdropPath: entityclass.backdropPath,
        title: entityclass.title,
        voteAverage: entityclass.voteAverage,
        releaseDate: entityclass.releaseDate);
    await datasource.addToFireStore(movieadd);
  }

  @override
  Future<void> deleteFromFireStore(String id) async {
    await datasource.deleteFromFirestore(id);
  }

  @override
  Stream<List<HomeApiServiceEntity>> getAllMovies() async* {
    final datasourceMovies = datasource.getAllMovies();
    await for (final snapshot in datasourceMovies) {
      final docs = snapshot.docs;
      yield [
        for (final model in docs)
          HomeApiServiceEntity(
              id: model.data().id,
              originalTitle: model.data().originalTitle,
              overview: model.data().overview,
              posterPath: model.data().posterPath,
              backdropPath: model.data().backdropPath,
              title: model.data().title,
              voteAverage: model.data().voteAverage,
              releaseDate: model.data().releaseDate)
      ];
    }
  }
}

@riverpod
FireStoreRepository firestoreRepository(FirestoreRepositoryRef ref) {
  return FirestoreRepositoryImpl(
      datasource: ref.read(firestoreHomeDatasourceProvider));
}
