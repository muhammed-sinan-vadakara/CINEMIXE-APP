import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cinemixe/feactures/home/data/models/review_home_model.dart';

abstract class ReviewHomeDataSource {
  Future<void> addReview(ReviewHomeModel model);
  Future<void> delReview(String id);
  Stream<QuerySnapshot<ReviewHomeModel>> getReview(String id);
}
