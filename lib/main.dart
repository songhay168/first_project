import 'package:first_project/basic_modules/future(async_await)/multitask_app.dart';
import 'package:flutter/material.dart';
import 'basic_modules/basic_app.dart';
import 'basic_modules/rdmUser/rdmUser_app.dart';

void main() {
  //runApp(BasicApp()); for big app
  runApp(rdmUserAppWithProvider()); //for test Future and async await
}
