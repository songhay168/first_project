import 'package:first_project/basic_modules/route_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatRoute extends StatefulWidget {
  const NavigatRoute({super.key});

  @override
  State<NavigatRoute> createState() => _NavigatRouteState();
}

class _NavigatRouteState extends State<NavigatRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Route"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RouteScreen("hello"),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: _buildBody(),
    );
  }

  List<String> fruits = ["coconut", "apple", "durian", "mango"];

  Widget _buildBody() {
    return ListView.builder(
      itemCount: fruits.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.face),
            title: Text("${fruits[index]}"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RouteScreen("${fruits[index]}"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
