import 'package:objectbox/objectbox.dart';

@Entity()
class HomeObjectEntityModel {
  @Id()
  int id = 0;

  String? movieId;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? title;
  double? voteAverage;
  String? releaseDate;

  HomeObjectEntityModel(
      {this.id = 0,
      required this.movieId,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.backdropPath,
      required this.title,
      required this.voteAverage,
      required this.releaseDate});
}