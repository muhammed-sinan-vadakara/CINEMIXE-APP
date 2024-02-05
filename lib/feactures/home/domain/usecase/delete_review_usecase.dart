import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/feactures/home/domain/repositories/review_home_repository.dart';

final class DeleteReviewUseCase {
  final ReviewHomeRepository repository;
  DeleteReviewUseCase({required this.repository});

  Future<void> call(String id) async {
    try {
      await repository.delReview(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
