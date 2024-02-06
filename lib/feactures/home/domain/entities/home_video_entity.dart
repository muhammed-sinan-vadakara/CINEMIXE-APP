import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_video_entity.freezed.dart';

@freezed
class HomeVideoEntity with _$HomeVideoEntity {
  factory HomeVideoEntity({
    required String name,
    required String key,
    required String type,
  }) = _HomeVideoEntity;
}
