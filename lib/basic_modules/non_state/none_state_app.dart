import 'package:flutter/material.dart';

import 'first_none_screen.dart';

class NoneStateApp extends StatefulWidget {
  const NoneStateApp({super.key});

  @override
  State<NoneStateApp> createState() => _NoneStateAppState();
}

class _NoneStateAppState extends State<NoneStateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstNoneScreen(),
    );
  }
}