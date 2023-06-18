import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/objectbox/database/database.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/bloc_api/index.dart';
import 'package:flutter_application_1/pages/objectbox/view.dart';
import 'package:flutter_application_1/pages/bloc_counter/view.dart';
import 'package:flutter_application_1/pages/classic_bloc/view.dart';
import 'package:flutter_application_1/pages/cubit_counter/view.dart';

import 'package:flutter_application_1/utils/api.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Database.init().then((database) => GetIt.I.registerSingleton(database));
  GetIt.I.registerSingleton(Api());
  GetIt.I.registerSingleton(SimpleLogger());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/home',
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/classic_bloc',
            builder: (context, state) => const ClassicBloc(),
          ),
          GoRoute(
            path: '/counter_bloc',
            builder: (context, state) => const BlocTrain(),
          ),
          GoRoute(
            path: '/counter_cubit',
            builder: (context, state) => const ProductListPage(),
          ),
          GoRoute(
            path: '/bloc_api',
            builder: (context, state) => const BlocApi(),
          ),
          GoRoute(
            path: '/database',
            builder: (context, state) => const DatabaseView(),
          ),
        ],
      ),
    );
  }
}
