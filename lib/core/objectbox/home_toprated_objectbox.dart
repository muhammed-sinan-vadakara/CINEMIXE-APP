import 'package:cinemixe_app/feactures/home/data/models/home_toprated_objectbox_entity_model.dart';
import 'package:cinemixe_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TopRatedObjectBox {
  static TopRatedObjectBox? _instance;

  final Store store;
  late final Box<HomeTopMoviesEntity> box;

  TopRatedObjectBox._create(this.store) {
    box = store.box<HomeTopMoviesEntity>();
  }

  static TopRatedObjectBox get instance {
    return _instance!;
  }

  static Future<void> createMethod() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store =
          await openStore(directory: join(docDir.path, 'MovieFliqtwo'));
      _instance = TopRatedObjectBox._create(store);
    }
  }
}
