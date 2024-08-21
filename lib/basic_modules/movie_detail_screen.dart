import 'package:flutter/material.dart';

import 'movie_model.dart';

class MovieDetailScreen extends StatefulWidget {
  // const MovieDetailScreen({super.key});

  MovieModel item;

  MovieDetailScreen(this.item);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "${this.widget.item.title}",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        Container(
          width: double.maxFinite,
          height: 400,
          child: Image.network(this.widget.item.image, fit: BoxFit.cover),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${this.widget.item.title}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${this.widget.item.des}",
            style: TextStyle(
              color: Color.fromARGB(255, 228, 68, 68),
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
