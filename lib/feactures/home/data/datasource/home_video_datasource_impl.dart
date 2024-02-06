import 'package:cinemixe_app/core/contants/home/home_apiservice_constants.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_video_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/models/home_video_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_video_datasource_impl.g.dart';

class HomeVideoDataSourceImpl implements HomeVideoDataSource {
  final dio = Dio();
  final token = HomeApiServicetokenConstants().token;
  @override
  Future<HomeVideoModel> getdata(String id) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response =
        await dio.get('https://api.themoviedb.org/3/movie/$id/videos');
    return HomeVideoModel.fromJson(response.data);
  }
}

@riverpod
HomeVideoDataSource videoDs(VideoDsRef ref) {
  return HomeVideoDataSourceImpl();
}
