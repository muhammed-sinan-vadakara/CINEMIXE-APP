import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/review_home_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/review_home_repository.dart';

final class GetReviewUseCase {
  final ReviewHomeRepository repository;
  GetReviewUseCase({required this.repository});

  Stream<List<ReviewHomeEntity>> call(String id) {
    try {
      return repository.getReview(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
