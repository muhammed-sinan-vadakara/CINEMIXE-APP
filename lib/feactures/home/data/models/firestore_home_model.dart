import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_home_model.freezed.dart';
part 'firestore_home_model.g.dart';

@freezed
class FirestoreHomeModel with _$FirestoreHomeModel {
  const FirestoreHomeModel._();

  factory FirestoreHomeModel({
    required String id,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String backdropPath,
    required String title,
    required double voteAverage,
    required DateTime releaseDate,
  }) = _FirestoreHomeModel;

  factory FirestoreHomeModel.fromJson(Map<String, dynamic> json) =>
      _$FirestoreHomeModelFromJson(json);

  factory FirestoreHomeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FirestoreHomeModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
