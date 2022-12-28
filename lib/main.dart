import 'package:flutter/material.dart';
import 'package:vault/routing/router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
