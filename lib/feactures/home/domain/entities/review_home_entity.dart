import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_home_entity.freezed.dart';

@freezed
class ReviewHomeEntity with _$ReviewHomeEntity {
  factory ReviewHomeEntity({
    required String review,
    required String id,
    required String movieId,
  }) = _ReviewHomeEntity;
}
