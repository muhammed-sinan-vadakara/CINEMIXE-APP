import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';
import 'package:cinemixe_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HomeMovieStoreObjectBox {
  static HomeMovieStoreObjectBox? _instance;

  final Store store;
  late final Box<HomeObjectBoxMovieEntity> box;

  HomeMovieStoreObjectBox._create(this.store) {
    box = store.box<HomeObjectBoxMovieEntity>();
  }

  static HomeMovieStoreObjectBox get instance {
    return _instance!;
  }

  static Future<void> createMethod() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'MovieFliq'));
      _instance = HomeMovieStoreObjectBox._create(store);
    }
  }
}
