import 'package:cinemixe/feactures/home/domain/entities/review_home_entity.dart';

abstract class ReviewHomeRepository {
  Future<void> addReview(ReviewHomeEntity entity);
  Future<void> delReview(String id);
  Stream<List<ReviewHomeEntity>> getReview(String id);
}
