import 'package:cinemixe_app/feactures/home/data/models/home_video_model.dart';

abstract class HomeVideoDataSource {
  Future<HomeVideoModel> getdata(String id);
}
