import 'package:flutter/material.dart';

class ChildrenScreen extends StatefulWidget {
  const ChildrenScreen({super.key});

  @override
  State<ChildrenScreen> createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      // bottomNavigationBar: _buildBottom(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.dark_mode),
      //   onPressed: (){},
      // ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.indigo,
            ],
          ),
        ),
      ),
      title: Text("Some App"),
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(30),
      //   child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: _buildTopMenu(),
      //   ),
      // ),
    );
  }

  Widget _buildTopMenu() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            child: Text(
              "Popular",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onTap: () {},
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text(
              "Trends",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onTap: () {},
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text(
              "Famous",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onTap: () {},
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text(
              "Favorite",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onTap: () {},
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text(
              "Wish List",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onTap: () {},
          ),
          SizedBox(width: 20),
          InkWell(
            child: Text(
              "My List",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return BottomAppBar(
      color: Colors.yellow[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return _buildExpandedColumn();
  }

  Widget _buildExpandedColumn() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.red,
          child: _buildTopMenu(),
        ),
        Expanded(
          child: _buildCustomBody(),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 176, 185, 235),
                const Color.fromARGB(255, 216, 150, 172),
              ],
            ),
          ),
          child: _buildBottomMenu(),
        ),
      ],
    );
  }

  Widget _buildCustomBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.network(
            "https://th.bing.com/th/id/OIP.Pg0mjEH9ACj7Ct8gr8FnWgHaK9?rs=1&pid=ImgDetMain",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Column(
            children: [
              IconButton.filled(
                onPressed: () {},
                icon: Icon(Icons.favorite),
                style: IconButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 92, 4, 243)),
              ),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.dark_mode),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBottomMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    );
  }

  Widget _buildRow() {
    return Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(width: 150, height: 50, color: Colors.red),
            Container(width: 170, height: 30, color: Colors.blue),
            Container(width: 130, height: 60, color: Colors.green),
            Container(width: 140, height: 40, color: Colors.pink),
            Container(width: 180, height: 50, color: Colors.brown),
            Container(width: 120, height: 40, color: Colors.indigo),
          ],
        ),
      ),
    );
  }

  Widget _buildStack() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 350, height: 350, color: Colors.red),
          Container(width: 270, height: 230, color: Colors.blue),
          Container(width: 130, height: 160, color: Colors.green),
          Container(width: 80, height: 100, color: Colors.brown),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(width: 50, height: 50, color: Colors.yellow),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Center(
      child: Container(
        // color: Colors.yellow[200],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 70, height: 30, color: Colors.blue),
            Container(width: 30, height: 60, color: Colors.green),
            Container(width: 40, height: 40, color: Colors.pink),
            Container(width: 80, height: 50, color: Colors.brown),
            Container(width: 20, height: 40, color: Colors.indigo),
          ],
        ),
      ),
    );
  }
}
