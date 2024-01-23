import 'package:cinemixe/feactures/home/data/repository/home_apiservice_repository_impl.dart';
import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe/feactures/home/domain/repositories/home_repository.dart';
import 'package:cinemixe/feactures/home/domain/usecase/home_apiservice_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_apiservice_provider.g.dart';

@riverpod
class HomeApiService extends _$HomeApiService {
  late final HomeApiServiceRepository repository;
  @override
  Future<List<HomeApiServiceEntity>> build() async {
    repository = ref.watch(homeApiServiceRepositoryProvider);
    return HomeApiServiceUseCase(repository: repository)();
  }
}
