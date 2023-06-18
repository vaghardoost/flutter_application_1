import 'package:flutter_application_1/objectbox.g.dart';
import 'package:flutter_application_1/pages/objectbox/database/person.model.dart';

class Database {
  late final Store _store;
  late final Box<PersonModel> _personBox;

  Database._init(this._store) {
    _personBox = Box<PersonModel>(_store);
  }

  static Future<Database> init() async {
    final store = await openStore();
    return Database._init(store);
  }

  List<PersonModel> get all => _personBox.getAll();

  insert(PersonModel model) => _personBox.put(model);
}
