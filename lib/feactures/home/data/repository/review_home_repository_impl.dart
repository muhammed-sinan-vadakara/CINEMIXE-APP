import 'package:cinemixe/feactures/home/data/datasource/review_home_datasource.dart';
import 'package:cinemixe/feactures/home/data/datasource/review_home_datasource_impl.dart';
import 'package:cinemixe/feactures/home/data/models/review_home_model.dart';
import 'package:cinemixe/feactures/home/domain/entities/review_home_entity.dart';
import 'package:cinemixe/feactures/home/domain/repositories/review_home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_home_repository_impl.g.dart';

class ReviewHomeRepositoryImpl implements ReviewHomeRepository {
  final ReviewHomeDataSource dataSource;
  ReviewHomeRepositoryImpl({required this.dataSource});

  @override
  Future<void> addReview(ReviewHomeEntity entity) async {
    final docs = ReviewHomeModel(
      review: entity.review,
      movieId: entity.movieId,
    );
    await dataSource.addReview(docs);
  }

  @override
  Future<void> delReview(String id) async {
    await dataSource.delReview(id);
  }

  @override
  Stream<List<ReviewHomeEntity>> getReview(String id) async* {
    final ds = dataSource.getReview(id);
    await for (final d in ds) {
      final data = d.docs;
      yield [
        for (final i in data)
          ReviewHomeEntity(
              review: i.data().review, movieId: i.data().movieId, id: i.id)
      ];
    }
  }
}

@riverpod
ReviewHomeRepository reviewHomeRepository(ReviewHomeRepositoryRef ref) {
  return ReviewHomeRepositoryImpl(
      dataSource: ref.read(reviewHomeDataSourceProvider));
}
