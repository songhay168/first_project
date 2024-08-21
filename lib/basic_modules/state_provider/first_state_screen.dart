import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';
import 'second_state_screen.dart';
import 'theme_logic.dart';

class FirstStateScreen extends StatefulWidget {
  const FirstStateScreen({super.key});

  @override
  State<FirstStateScreen> createState() => _FirstStateScreenState();
}

class _FirstStateScreenState extends State<FirstStateScreen> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    _dark = context.watch<ThemeLogic>().dark;
    print(_dark);

    return Scaffold(
      backgroundColor: _dark ? Colors.black : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      //backgroundColor: Colors.orange,
      title: Text("First State Screen"),
      actions: [
        IconButton(
          onPressed: () {
            context.read<CounterLogic>().decrease();
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            context.read<CounterLogic>().increase();
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            context.read<ThemeLogic>().toggleDark();
          },
          icon: Icon(Icons.dark_mode),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SecondStateScreen(),
              ),
            );
          },
          icon: Icon(Icons.share),
        ),
      ],
    );
  }

  // int _counter = 0;

  Widget _buildBody() {
    int cnt = context.watch<CounterLogic>().counter;

    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        "A wrapper around InheritedWidget to make them easier to use and more reusable.",
        style: TextStyle(
          fontSize: 18 + cnt.toDouble(),
          color: _dark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
