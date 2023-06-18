import '../database/person.model.dart';

abstract class DatabaseEvent {}

class DatabaseInsert extends DatabaseEvent{
  final PersonModel _model;
  DatabaseInsert(this._model);
}
