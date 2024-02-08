// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_apiservice_entity.freezed.dart';

@freezed
class HomeApiServiceEntity with _$HomeApiServiceEntity {
  const factory HomeApiServiceEntity({
  required String id,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String backdropPath,
    required String title,
    required double voteAverage,
    required DateTime releaseDate,
  }) = _HomeApiServiceEntity;
}
