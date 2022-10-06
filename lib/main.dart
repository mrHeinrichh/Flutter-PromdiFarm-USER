import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:promdifarm_app/core/const/index.dart';
import 'package:promdifarm_app/core/di/index.dart';
import 'package:promdifarm_app/core/routes/index.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

final _router = GoRouter(
  initialLocation: "/${ROUTE.LOGIN}",
  routes: Routes.routes,
  errorPageBuilder: Routes.errorPage,
);
