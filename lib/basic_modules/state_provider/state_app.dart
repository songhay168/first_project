import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';
import 'first_state_screen.dart';
import 'theme_logic.dart';

Widget stateAppWithProvider() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
    ],
    child: StateApp(),
  );
}

class StateApp extends StatefulWidget {
  const StateApp({super.key});

  @override
  State<StateApp> createState() => _StateAppState();
}

class _StateAppState extends State<StateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstStateScreen(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
      ),
    );
  }
}
