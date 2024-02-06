import 'dart:async';

import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/core/utils/snackbar_utils.dart';
import 'package:cinemixe_app/feactures/home/data/repository/firestore_home_repository_impl.dart';
import 'package:cinemixe_app/feactures/home/data/repository/home_apiservice_repository_impl.dart';
import 'package:cinemixe_app/feactures/home/data/repository/home_objectbox_repository_impl.dart';
import 'package:cinemixe_app/feactures/home/data/repository/review_home_repository_impl.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/review_home_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_objectbox_repository.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/addreview_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/addtofirestore_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/checkfavarite_movies_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/delete_review_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/deletefromfirestore_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/firestore_getall_movies_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/getmovie_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/getreview_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/searchmovie_usecase.dart';
import 'package:cinemixe_app/feactures/home/domain/usecase/toprated_firestore_usecase.dart';
import 'package:cinemixe_app/feactures/home/presentation/providers/home_apiservice_provider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_apiservice_provider.g.dart';

@riverpod
class HomeApiServiceProvider extends _$HomeApiServiceProvider {
  @override
  Future<HomeApiserviceProviderState> build() async {
    final HomeApiServiceRepository repository =
        ref.read(homeApiServiceRepositoryProvider);
    final HomeObjectBoxMovieRepository objectRepository = ref.watch(homeObjectBoxMovieRepositoryProvider);
    getAllMovies();
    final result = await Future.wait([
      GetMoviesUseCase(repository: repository,objectRepository:objectRepository)(),
      TopRatedUseCase(repository: repository)(),
    ]);
    return HomeApiserviceProviderState( 
      searchMovies: null,
      getMovies: result[0],
      toprated: result[1],
      favMovies: [],
      favMoviesStream: getAllMovies().asBroadcastStream(),
    );
  }

  Future<void> searchMovies(String text, BuildContext context) async {
    try {
      final repository = ref.watch(homeApiServiceRepositoryProvider);
      final data = await SearchMovieUseCase(repository: repository)(text);
      state = AsyncValue.data(state.value!.copyWith(searchMovies: data));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

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

  Future<void> addReview(ReviewHomeEntity entity) async {
    final repository = ref.watch(reviewHomeRepositoryProvider);
    await AddReviewUseCase(repository: repository)(entity);
  }

  Future<void> delReview(String id) async {
    final repository = ref.watch(reviewHomeRepositoryProvider);
    await DeleteReviewUseCase(repository: repository)(id);
  }

  Stream<List<ReviewHomeEntity>> getreviews(String id) {
    final repository = ref.watch(reviewHomeRepositoryProvider);
    return GetReviewUseCase(repository: repository)(id);
  }

  bool isMovieFavourite(String movieId) {
    return CheckFavariteMoviesUsecase()(movieId, state.value!.favMovies);
  }
}

final readmoreProvider = StateProvider<bool>((ref) {
  return false;
});

// import 'package:cinemixe_app/feactures/home/data/repository/home_apiservice_repository_impl.dart';
// import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
// import 'package:cinemixe_app/feactures/home/domain/repositories/home_repository.dart';
// import 'package:cinemixe_app/feactures/home/domain/usecase/home_apiservice_usecase.dart';
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
