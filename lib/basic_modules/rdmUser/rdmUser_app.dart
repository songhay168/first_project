import 'package:first_project/basic_modules/future(async_await)/product_screen.dart';
import 'package:first_project/basic_modules/rdmUser/rdmUser_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'rdmUser_logic.dart';

Widget rdmUserAppWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RdmUserLogic()),
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
      home: RdmUserScreen(),
    );
  }
}
