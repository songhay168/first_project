import 'package:first_project/basic_modules/movie_model.dart';
import 'package:flutter/material.dart';

import 'movie_detail_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Movie Screen",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.grey[900],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildListView();
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index]);
      },
    );
  }

  Widget _buildItem(MovieModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(item),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${item.title}",
                style: TextStyle(
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 400,
              child: Image.network(item.image, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
