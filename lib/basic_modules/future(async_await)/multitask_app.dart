import 'package:first_project/basic_modules/future(async_await)/product_logic.dart';
import 'package:first_project/basic_modules/future(async_await)/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task1_screen.dart';

Widget multiTaskAppWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductLogic()),
    ],
    child: MultiTaskApp(),
  );
}

class MultiTaskApp extends StatelessWidget {
  const MultiTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: ProductScreen(),
    );
  }
}
