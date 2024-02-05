import 'package:cinemixe/core/exceptions/base_exception.dart';
import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe/feactures/home/domain/repositories/firestore_home_repository.dart';

final class AddtoFireStoreUsecase {
  final FireStoreRepository repository;
  AddtoFireStoreUsecase({required this.repository});

  Future<void> call(HomeApiServiceEntity entityclass) async {
    try {
      await repository.addtofirestore(entityclass);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
