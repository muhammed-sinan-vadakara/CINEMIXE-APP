import 'package:cinemixe_app/feactures/home/data/datasource/home_video_datasource.dart';
import 'package:cinemixe_app/feactures/home/data/datasource/home_video_datasource_impl.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_video_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_video_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_video_repository_impl.g.dart';

class HomeVideoRepositoryImpl implements HomeVideoRepository {
  final HomeVideoDataSource dataSource;
  HomeVideoRepositoryImpl({required this.dataSource});

  @override
  Future<List<HomeVideoEntity>> getData(String id) async {
    final data = await dataSource.getdata(id);
    late List<HomeVideoEntity> results;

    results = [
      for (final model in data.results)
        HomeVideoEntity(name: model.name, key: model.key, type: model.type)
    ];
    return results;
  }
}

@riverpod
HomeVideoRepository videorepo(VideorepoRef ref) {
  return HomeVideoRepositoryImpl(dataSource: ref.watch(videoDsProvider));
}
