import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("application"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => GoRouter.of(context).push('/classic_bloc'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "Classic Bloc",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => context.push('/counter_bloc'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "Counter Bloc",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => context.push('/counter_cubit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "Counter Cubit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => context.push('/bloc_api'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "Bloc API",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => context.push('/database'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "Database CRUD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => context.push('/hero'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "Hero",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => context.push('/riverpod'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "Riverpod",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scaffoldKey.currentState?.showBottomSheet(
            (context) => Container(
              color: Colors.white,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Hello", style: TextStyle(fontSize: 22)),
                  Text("we are here to coding"),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.question_mark_rounded),
      ),
    );
  }
}
