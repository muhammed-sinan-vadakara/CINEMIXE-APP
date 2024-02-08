import 'package:cinemixe_app/feactures/home/data/models/home_objectbox_entity_model.dart';
import 'package:cinemixe_app/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class MovieObjectBox {
  static MovieObjectBox? _instance;

  late final Store store;
  late final Box<HomeObjectEntityModel> movieBox;

  MovieObjectBox._create(this.store) {
    movieBox = store.box<HomeObjectEntityModel>();
  }

  static MovieObjectBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final documentDirectory = await getApplicationDocumentsDirectory();
      final store = await openStore(
          directory: join(documentDirectory.path, 'FilmyBeatz'));
      _instance = MovieObjectBox._create(store);
    }
  }
}
