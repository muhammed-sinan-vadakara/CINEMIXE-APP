// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_video_model.freezed.dart';
part 'home_video_model.g.dart';

@freezed
class HomeVideoModel with _$HomeVideoModel {
  factory HomeVideoModel({
    required int id,
    required List<Resultss> results,
  }) = _HomeVideoModel;

  factory HomeVideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}

@freezed
class Resultss with _$Resultss {
  factory Resultss({
    @JsonKey(name: "iso_639_1") required String iso6391,
    @JsonKey(name: "iso_3166_1") required String iso31661,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    required bool official,
    @JsonKey(name: "published_at") required DateTime publishedAt,
    required String id,
  }) = _Resultss;

  factory Resultss.fromJson(Map<String, dynamic> json) => _$ResultssFromJson(json);
}