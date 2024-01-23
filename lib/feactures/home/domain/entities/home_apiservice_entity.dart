import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_apiservice_entity.freezed.dart';

@freezed
class HomeApiServiceEntity with _$HomeApiServiceEntity{
  const factory HomeApiServiceEntity({
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String title,
    required double voteAverage,
  }) = _HomeApiServiceEntity;

}
