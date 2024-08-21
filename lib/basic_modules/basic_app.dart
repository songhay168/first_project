import 'package:first_project/basic_modules/fb_screen.dart';
import 'package:first_project/basic_modules/food_menu.dart';
import 'package:first_project/basic_modules/login_screen.dart';
import 'package:first_project/basic_modules/convert.dart';
import 'package:first_project/basic_modules/main_screen.dart';
import 'package:first_project/basic_modules/ListGrid_View.dart';
import 'package:first_project/basic_modules/movie_screen.dart';
import 'package:first_project/basic_modules/navigat_route.dart';
import 'package:first_project/basic_modules/non_state/none_state_app.dart';
import 'package:first_project/basic_modules/state_provider/state_app.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: stateAppWithProvider(),
    );
  }
}
