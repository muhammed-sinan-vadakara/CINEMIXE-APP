import 'package:cinemixe_app/feactures/home/data/repository/home_video_repository_impl.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_video_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/home_video_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_video_trailer_provider.g.dart';

@riverpod
Future<List<HomeVideoEntity>> trailer(TrailerRef ref, String movieId) async {
  return await HomeVideoUseCase(repository: ref.read(videorepoProvider))(
      movieId);
}
