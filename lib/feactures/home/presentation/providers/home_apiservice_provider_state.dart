import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_apiservice_provider_state.freezed.dart';

@freezed
class HomeApiserviceProviderState with _$HomeApiserviceProviderState {
  factory HomeApiserviceProviderState({
    required List<HomeApiServiceEntity> getMovies,
    required List<HomeApiServiceEntity> toprated,
    required List<HomeApiServiceEntity>? searchMovies,
    required Stream<List<HomeApiServiceEntity>> favMoviesStream,
    required List<HomeApiServiceEntity> favMovies,
  }) = _HomeApiserviceProviderState;
}
