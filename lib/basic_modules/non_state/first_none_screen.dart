import 'package:flutter/material.dart';

import 'second_none_screen.dart';

class FirstNoneScreen extends StatefulWidget {
  const FirstNoneScreen({super.key});

  @override
  State<FirstNoneScreen> createState() => _FirstNoneScreenState();
}

class _FirstNoneScreenState extends State<FirstNoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("First None Screen"),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _counter -= 2;
            });
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _counter += 2;
            });
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SecondNoneScreen(_counter),
              ),
            );
          },
          icon: Icon(Icons.share),
        ),
      ],
    );
  }

  int _counter = 0;

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Counter: $_counter",
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
