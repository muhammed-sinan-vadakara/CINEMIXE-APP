import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_home_model.g.dart';
part 'review_home_model.freezed.dart';

@freezed
class ReviewHomeModel with _$ReviewHomeModel {
  const ReviewHomeModel._();

  factory ReviewHomeModel({
    required String review,
    required String movieId,
  }) = _ReviewHomeModel;

  factory ReviewHomeModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewHomeModelFromJson(json);

  factory ReviewHomeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return ReviewHomeModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
