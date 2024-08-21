import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task1Screen extends StatefulWidget {
  const Task1Screen({super.key});

  @override
  State<Task1Screen> createState() => _Task1ScreenState();
}

class _Task1ScreenState extends State<Task1Screen> {
  Future hi(String name) async {
    print("hi $name");
  }

  Future<int> add(int a, int b) {
    return Future.value(a + b);
  }

  int sum(int a, int b) {
    return a + b;
  }

  void hello(String name) {
    print("hello $name");
  }

  Future<String> _getFakeData() {
    return Future.delayed(Duration(seconds: 3), () => "fake data");
  }

  Future<String> _fechData() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    hi("Sao");
    add(20, 30).then((value) => print("value = $value"));
    int s = sum(10, 20);
    print("s = $s");
    hello("Sok");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Task 1 Screen",
            style: TextStyle(color: Colors.black, fontSize: 28)),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Hello"),
                ),
              );
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Center(
      child: FutureBuilder(
          future: _fechData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _buildData(snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget _buildData(String? data) {
    if (data == null) {
      return Center(
        child: Text("Something went wrong"),
      );
    }

    List list = json.decode(data);

    List<Map<String, dynamic>> products =
        list.map((x) => x as Map<String, dynamic>).toList();

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildItem(products[index]);
      },
    );
  }

  Widget _buildItem(Map<String, dynamic> item) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Image.network(
            item['image'],
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item['title']),
        subtitle: Text("${item['price']}"),
      ),
    );
  }

  int _calcul(int max) {
    int total = 0;
    for (int index = 0; index < max; index++) {
      total += index;
    }
    return total;
  }
}
