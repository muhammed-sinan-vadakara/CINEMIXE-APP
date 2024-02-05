import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_apiservice_constants.g.dart';

class HomeApiServicetokenConstants {
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTQ3ZDgyZmMwMTc4MzFjM2FiMTc0YTc2MDlmMGFmNyIsInN1YiI6IjY1ODI4M2FlODU4Njc4NTUyZWY2NTE0ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.clMkEIKeFvPYtopThCd8YHINYEl164PA6kzVyYPP3Jw';

  final imagePath = 'https://image.tmdb.org/t/p/original';
}

@riverpod
HomeApiServicetokenConstants homeApiServicetokenConstants(
    HomeApiServicetokenConstantsRef ref) {
  return HomeApiServicetokenConstants();
}
