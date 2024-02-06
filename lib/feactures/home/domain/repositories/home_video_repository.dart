import 'package:cinemixe_app/feactures/home/domain/entities/home_video_entity.dart';

abstract class HomeVideoRepository {
  Future<List<HomeVideoEntity>> getData(String id);
}
