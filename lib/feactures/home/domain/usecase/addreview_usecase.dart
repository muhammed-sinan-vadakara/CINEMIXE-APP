import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/review_home_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/review_home_repository.dart';

final class AddReviewUseCase {
  final ReviewHomeRepository repository;
  AddReviewUseCase({required this.repository});

  Future<void> call(ReviewHomeEntity entity) async {
    try {
      await repository.addReview(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
