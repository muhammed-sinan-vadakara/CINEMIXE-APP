import 'package:cinemixe_app/feactures/home/data/models/home_popular_objectbox_entity_model.dart';
import 'package:cinemixe_app/objectbox.g.dart';
// import 'package:movie_application/features/movie_feature2/data/models/popular_objectbox_entity.dart';
// import 'package:movie_application/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class PopularObjectBox {
  static PopularObjectBox? _instance;

  final Store store;
  late final Box<HomePopularEntity> box;

  PopularObjectBox._create(this.store) {
    box = store.box<HomePopularEntity>();
  }

  static PopularObjectBox get instance {
    return _instance!;
  }

  static Future<void> createMethod() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store =
          await openStore(directory: join(docDir.path, 'MovieFliqthree'));
      _instance = PopularObjectBox._create(store);
    }
  }
}
