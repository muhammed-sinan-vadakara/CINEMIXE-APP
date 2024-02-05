import 'package:cinemixe/core/exceptions/base_exception.dart';
import 'package:cinemixe/feactures/home/domain/repositories/firestore_home_repository.dart';

final class DeleteFromFirebaseUseCase {
  final FireStoreRepository repository;
  DeleteFromFirebaseUseCase({required this.repository});

  Future<void> call(String id) async {
    try {
      await repository.deleteFromFireStore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
