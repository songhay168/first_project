import 'package:flutter/material.dart';

class SecondNoneScreen extends StatefulWidget {
  // const SecondNoneScreen({super.key});

  int number;

  SecondNoneScreen(this.number);

  @override
  State<SecondNoneScreen> createState() => _SecondNoneScreenState();
}

class _SecondNoneScreenState extends State<SecondNoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.pink,
      title: Text("Secon None Screen"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    this.widget.number-=3;
                  });
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    this.widget.number+=3;
                  });
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Text(
            "Counter: ${this.widget.number}",
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
