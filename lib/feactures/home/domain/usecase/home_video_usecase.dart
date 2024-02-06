import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_video_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_video_repository.dart';
import 'package:dio/dio.dart';

final class HomeVideoUseCase {
  final HomeVideoRepository repository;
  HomeVideoUseCase({required this.repository});

  Future<List<HomeVideoEntity>> call(String id) async {
    try {
      final videos = await repository.getData(id);
      final trailers = videos
          .where((video) => video.type.toLowerCase().trim() == 'trailer')
          .toList();
      return trailers;
    } catch (e) {
      throw BaseException(
          'Error while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}
