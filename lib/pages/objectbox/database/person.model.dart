import 'package:objectbox/objectbox.dart';

@Entity()
class PersonModel {
  int id;
  String name;
  DateTime dateCreated;

  PersonModel(
    this.name, {
    this.id = 0,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();
}
