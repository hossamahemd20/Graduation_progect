import 'package:flutter/material.dart';

import 'core/page_route_names.dart';
import 'core/routes_generator.dart';
import 'model/splash screen/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Graduation Project',

      home: SplashView(),
      initialRoute: PageRouteNames.initial,
      onGenerateRoute: RouteGenerator.onGeneratorRoute,
    );
  }
}
