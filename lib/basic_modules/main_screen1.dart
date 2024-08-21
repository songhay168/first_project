import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _bottonNavicationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildfloatingButton(),
    );
  }

  Widget _buildfloatingButton() {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 140, 195, 251),
      child: Icon(Icons.movie_creation),
      shape: CircleBorder(),
      onPressed: () {},
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      //FF: ព្រាល
      backgroundColor: Color.fromARGB(255, 1, 39, 77),
      title: _buildAppBarTitle(),
      //for cut the appbar edge
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }

  Widget _bottonNavicationBar() {
    return BottomAppBar(
      color: Color.fromARGB(255, 238, 236, 236),
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: Text("New Movie"),
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 253, 253, 253))),
        TextButton(
            onPressed: () {},
            child: Text("Popular Movie"),
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 253, 253, 253))),
        TextButton(
            onPressed: () {},
            child: Text("Upcoming Movie"),
            style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 253, 253, 253))),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        _buildBody1(),
        SizedBox(
          height: 20,
        ),
        _buildBody2(),
      ],
    );
  }

  Widget _buildBody1() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        width: 120,
        height: 120,
        color: Color.fromARGB(255, 5, 240, 17),
      ),
      Container(
        width: 120,
        height: 120,
        color: Color.fromARGB(255, 230, 8, 82),
      ),
      Container(
        width: 120,
        height: 120,
        color: Colors.blue,
      )
    ]);
  }

  Widget _buildBody2() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        width: 120,
        height: 120,
        color: Color.fromARGB(255, 5, 240, 17),
      ),
      Container(
        width: 120,
        height: 120,
        color: Color.fromARGB(255, 230, 8, 82),
      ),
      Container(
        width: 120,
        height: 120,
        color: Colors.blue,
      )
    ]);
  }
}
