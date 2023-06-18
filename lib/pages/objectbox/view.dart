import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/objectbox/database/database.dart';
import 'package:flutter_application_1/pages/objectbox/database/person.model.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_logger/simple_logger.dart';

class DatabaseView extends StatefulWidget {
  const DatabaseView({Key? key}) : super(key: key);

  @override
  State<DatabaseView> createState() => _DatabaseViewState();
}

class _DatabaseViewState extends State<DatabaseView> {
  late final Database database;
  late final SimpleLogger log;

  @override
  void initState() {
    database = GetIt.I.get<Database>();
    log = GetIt.I.get<SimpleLogger>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("database"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            TextButton(
              onPressed: () => database.insert(PersonModel("name")),
              child: const Text('Insert'),
            ),
            TextButton(
              onPressed: () => log.info(database.all),
              child: const Text('List'),
            ),
          ],
        ),
      ),
    );
  }
}
