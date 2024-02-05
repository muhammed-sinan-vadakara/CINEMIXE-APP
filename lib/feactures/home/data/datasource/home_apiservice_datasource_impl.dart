import 'package:cinemixe_app/core/contants/home/home_apiservice_constants.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_apiservice_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/models/home_apiservice_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_apiservice_datasource_impl.g.dart';

class HomeApiServiceDataSourceImpl implements HomeApiServiceDataSource {
  static final dio = Dio();
  final token = HomeApiServicetokenConstants().token;
  @override
  Future<HomeApiServiceModel> getMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc");

    return HomeApiServiceModel.fromJson(response.data);
  }

  @override
  Future<HomeApiServiceModel> searchMovies(String text) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(
      "https://api.themoviedb.org/3/search/movie",
      queryParameters: {
        'query': text,
        'include_adult': true,
        'language': 'en-US',
        'page': 1,
      },
    );
    return HomeApiServiceModel.fromJson(response.data);
  }

  @override
  Future<HomeApiServiceModel> topRated() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(
        "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1");
    return HomeApiServiceModel.fromJson(response.data);
  }
}

@Riverpod()
HomeApiServiceDataSource homeApiServiceDataSource(
    HomeApiServiceDataSourceRef ref) {
  return HomeApiServiceDataSourceImpl();
}

// curl --request GET \
//      --url 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc' \
//      --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTQ3ZDgyZmMwMTc4MzFjM2FiMTc0YTc2MDlmMGFmNyIsInN1YiI6IjY1ODI4M2FlODU4Njc4NTUyZWY2NTE0ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.clMkEIKeFvPYtopThCd8YHINYEl164PA6kzVyYPP3Jw' \
//      --header 'accept: application/json'
