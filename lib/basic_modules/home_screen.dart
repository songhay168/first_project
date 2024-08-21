import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  String img =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Emblem_of_the_Ministry_of_Education%2C_Youth_and_Sport_%28Cambodia%29.svg/888px-Emblem_of_the_Ministry_of_Education%2C_Youth_and_Sport_%28Cambodia%29.svg.png?20110624073833";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      //inwell here is if u tocht anything in the screen u will close the keyboard
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _buildBody(),
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildBody() {
    String pic = "pitures/transformer.jpg";
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(pic),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(children: [
        _buildUsernameField(),
        _buildPasswordField(),
      ]),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "បំពេញពាក្យសម្ងាត់របស់អ្នក",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.key),
        suffixIcon: Icon(Icons.remove_red_eye),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "បំពេញពាក្យសម្ងាត់របស់អ្នក",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.man),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      style: const TextStyle(
          color: Color.fromARGB(255, 253, 13, 13), fontFamily: 'ks'),
      decoration: InputDecoration(
        //filled: true,
        //fillColor: Colors.white,
        hintText: "ស្វែងរកកម្មវិធី",
        hintStyle: const TextStyle(color: Colors.white60),
        //hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      // leading: Icon(Icons.face),
      //FF: ព្រាល
      //RRGGBB:
      backgroundColor: const Color.fromRGBO(4, 126, 247, 1),
      // title: const Text("កម្មវិធីខ្មែរយើង",
      //     style: TextStyle(color: Colors.white, fontFamily: "ks")),
      title: _buildTextField(),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(img),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  ConvexAppBar _buildNavigationBar() {
    return ConvexAppBar(
      items: const [
        TabItem(icon: Icons.home, title: 'ទំព័រដើម', fontFamily: 'ks'),
        TabItem(icon: Icons.search, title: 'ស្វែងរក', fontFamily: 'ks'),
        TabItem(icon: Icons.add, title: 'បន្ថែមថ្មី', fontFamily: 'ks'),
        TabItem(icon: Icons.person, title: 'អ្នកប្រើប្រាស់', fontFamily: 'ks'),
      ],
      backgroundColor: const Color.fromRGBO(4, 126, 247, 1),
    );
  }
}
