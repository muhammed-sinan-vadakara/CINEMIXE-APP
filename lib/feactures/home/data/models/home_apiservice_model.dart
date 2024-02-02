// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_apiservice_model.freezed.dart';
part 'home_apiservice_model.g.dart';

@freezed
class HomeApiServiceModel with _$HomeApiServiceModel {
  const HomeApiServiceModel._();
  const factory HomeApiServiceModel({
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "results") required List<Result> results,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
  }) = _HomeApiServiceModel;

  factory HomeApiServiceModel.fromJson(Map<String, dynamic> json) =>
      _$HomeApiServiceModelFromJson(json);

  factory HomeApiServiceModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return HomeApiServiceModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}

@freezed
class Result with _$Result {
  const Result._();

  const factory Result({
    @JsonKey(name: "adult") required bool? adult,
    @JsonKey(name: "backdrop_path") required String? backdropPath,
    @JsonKey(name: "genre_ids") required List<int>? genreIds,
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "original_language") required String? originalLanguage,
    @JsonKey(name: "original_title") required String? originalTitle,
    @JsonKey(name: "overview") required String? overview,
    @JsonKey(name: "popularity") required double popularity,
    @JsonKey(name: "poster_path") required String? posterPath,
    @JsonKey(name: "release_date") required String? releaseDate,
    @JsonKey(name: "title") required String? title,
    @JsonKey(name: "video") required bool video,
    @JsonKey(name: "vote_average") required double? voteAverage,
    @JsonKey(name: "vote_count") required int? voteCount,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  factory Result.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Result.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}













// // ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'home_apiservice_model.freezed.dart';
// part 'home_apiservice_model.g.dart';

// @freezed
// class HomeApiServiceModel with _$HomeApiServiceModel {
//   const factory HomeApiServiceModel({
//     @JsonKey(name: "page") required int? page,
//     @JsonKey(name: "results") required List<Result> results,
//     @JsonKey(name: "total_pages") required int? totalPages,
//     @JsonKey(name: "total_results") required int? totalResults,
//   }) = _HomeApiServiceModel;

//   factory HomeApiServiceModel.fromJson(Map<String, dynamic> json) =>
//       _$HomeApiServiceModelFromJson(json);
// }

// @freezed
// class Result with _$Result {
//   const factory Result({
//     @JsonKey(name: "adult") required bool adult,
//     @JsonKey(name: "backdrop_path") required String backdropPath,
//     @JsonKey(name: "genre_ids") required List<int?> genreIds,
//     @JsonKey(name: "id") required int? id,
//     @JsonKey(name: "original_language") required String originalLanguage,
//     @JsonKey(name: "original_title") required String originalTitle,
//     @JsonKey(name: "overview") required String overview,
//     @JsonKey(name: "popularity") required double popularity,
//     @JsonKey(name: "poster_path") required String posterPath,
//     @JsonKey(name: "release_date") required DateTime releaseDate,
//     @JsonKey(name: "title") required String title,
//     @JsonKey(name: "video") required bool video,
//     @JsonKey(name: "vote_average") required double voteAverage,
//     @JsonKey(name: "vote_count") required int? voteCount,
//   }) = _Result;

//   factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
// }
