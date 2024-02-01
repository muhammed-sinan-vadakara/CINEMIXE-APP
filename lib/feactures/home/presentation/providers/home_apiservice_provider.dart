import 'package:cinemixe/feactures/home/data/repository/firestore_home_repository_impl.dart';
import 'package:cinemixe/feactures/home/data/repository/home_apiservice_repository_impl.dart';
import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe/feactures/home/domain/repositories/home_repository.dart';
import 'package:cinemixe/feactures/home/domain/usecase/addtofirestore_usecase.dart';
import 'package:cinemixe/feactures/home/domain/usecase/checkfavarite_movies_usecase.dart';
import 'package:cinemixe/feactures/home/domain/usecase/deletefromfirestore_usecase.dart';
import 'package:cinemixe/feactures/home/domain/usecase/firestore_getall_movies_usecase.dart';
import 'package:cinemixe/feactures/home/domain/usecase/getmovie_usecase.dart';
import 'package:cinemixe/feactures/home/presentation/providers/home_apiservice_provider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_apiservice_provider.g.dart';

@riverpod
class HomeApiServiceProvider extends _$HomeApiServiceProvider {
  @override
  Future<HomeApiserviceProviderState> build() async {
    final HomeApiServiceRepository repository =
        ref.read(homeApiServiceRepositoryProvider);
    getAllMovies();
    final result = await Future.wait([
      GetMoviesUseCase(repository: repository)(),
      // TopRatedUseCase(repository: repository)(),
    ] as Iterable<Future>);
    return HomeApiserviceProviderState(
        // searchmovies: null,
        getMovies: result[0],
        toprated: result[1],
        favMovies: [],
        favMoviesStream: getAllMovies().asBroadcastStream());
  }

  // Future<void> searchMovies(String text, BuildContext context) async {
  //   try {
  //     final repository = ref.watch(homeApiServiceRepositoryProvider);
  //     final data = await SearchMovieUseCase(repository: repository)(text);
  //     state = AsyncValue.data(state.value!.copyWith(searchmovies: data));
  //   } on BaseException catch (e) {
  //     Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
  //   }
  // }

  Future<void> addtoFireStore(HomeApiServiceEntity entity) async {
    final repository = ref.watch(firestoreRepositoryProvider);
    await AddtoFireStoreUsecase(repository: repository)(entity);
  }

  Future<void> deleteFromFireStore(String id) async {
    final repository = ref.watch(firestoreRepositoryProvider);
    await DeleteFromFirebaseUseCase(repository: repository)(id);
  }

  Stream<List<HomeApiServiceEntity>> getAllMovies() async* {
    final repository = ref.watch(firestoreRepositoryProvider);
    await for (final favMovies
        in GetAllMoviesFromFirestoreUseCase(repository: repository)()) {
      state = AsyncValue.data(state.value!.copyWith(favMovies: favMovies));
      yield favMovies;
    }
  }

  CheckFavariteMoviesUsecase isMovieFavourite(String movieId) {
    return CheckFavariteMoviesUsecase(movieId, state.value!.favMovies);
  }
}

final readmoreProvider = StateProvider<bool>((ref) {
  return false;
});





















// import 'package:cinemixe/feactures/home/data/repository/home_apiservice_repository_impl.dart';
// import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
// import 'package:cinemixe/feactures/home/domain/repositories/home_repository.dart';
// import 'package:cinemixe/feactures/home/domain/usecase/home_apiservice_usecase.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'home_apiservice_provider.g.dart';

// @riverpod
// class HomeApiService extends _$HomeApiService {
//   late final HomeApiServiceRepository repository;
//   @override
//   Future<List<HomeApiServiceEntity>> build() async {
//     repository = ref.watch(homeApiServiceRepositoryProvider);
//     return HomeApiServiceUseCase(repository: repository)();
//   }
// }
