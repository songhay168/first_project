import 'package:flutter/material.dart';

class RouteScreen extends StatefulWidget {
  //const RouteScreen({super.key});

  String text;

  RouteScreen(this.text);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Screen${this.widget.text}"),
      ),
    );
  }
}
