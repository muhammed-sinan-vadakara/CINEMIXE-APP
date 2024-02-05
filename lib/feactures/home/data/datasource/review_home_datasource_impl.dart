import 'package:cinemixe/feactures/home/data/datasource/review_home_datasource.dart';
import 'package:cinemixe/feactures/home/data/models/review_home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_home_datasource_impl.g.dart';

class ReviewHomeDataSourceImpl implements ReviewHomeDataSource {
  final collection = FirebaseFirestore.instance
      .collection("Reviews")
      .withConverter(
          fromFirestore: ReviewHomeModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> addReview(ReviewHomeModel model) async {
    await collection.add(model);
  }

  @override
  Future<void> delReview(String id) async {
    await collection.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<ReviewHomeModel>> getReview(String movieId) {
    return collection.where('movieId', isEqualTo: movieId).snapshots();
  }
}

@riverpod
ReviewHomeDataSource reviewHomeDataSource(ReviewHomeDataSourceRef ref) {
  return ReviewHomeDataSourceImpl();
}
