import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_logic.dart';
import 'theme_logic.dart';

class SecondStateScreen extends StatefulWidget {
  @override
  State<SecondStateScreen> createState() => _SecondStateScreenState();
}

class _SecondStateScreenState extends State<SecondStateScreen> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    _dark = context.watch<ThemeLogic>().dark;

    return Scaffold(
      backgroundColor: _dark ? Colors.black : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.orange,
      title: Text("Second State Screen",
          style: TextStyle(
            color: Colors.white,
          )),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
    );
  }

  Widget _buildBody() {
    int cnt = context.watch<CounterLogic>().counter;

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CounterLogic>().decrease();

                    // setState(() {
                    //   this.widget.number-=3;
                    // });
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    context.read<CounterLogic>().increase();

                    // setState(() {
                    //   this.widget.number+=3;
                    // });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            Text(
              "To expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.",
              style: TextStyle(
                fontSize: 18 + cnt.toDouble(),
                color: _dark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
