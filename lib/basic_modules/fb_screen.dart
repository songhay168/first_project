import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class FbScreen extends StatefulWidget {
  const FbScreen({super.key});

  @override
  State<FbScreen> createState() => _FbScreenState();
}

final Faker faker = Faker();

class _FbScreenState extends State<FbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildTopBar(),
        _buildStoryListView(),
        _buildPostListViewuildPost(),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        "Cool App",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
            fontFamily: 'Lobster'),
      ),
    );
  }

  Widget _buildStoryListView() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _MovieAPi.length,
        itemBuilder: (context, index) {
          return _buildStoryItem(_MovieAPi[index]);
        },
      ),
    );
  }

  //story like instagram
  Widget _buildStoryItem(String image) {
    return Stack(
      children: [
        Container(
          width: 150,
          decoration: (BoxDecoration(
            color: Color.lerp(Colors.pink, Colors.white, 0.5),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 5,
            ),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          )),
          // margin: EdgeInsets.only(right: 10),
        ),
        Positioned(
          child: IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.thumb_up, color: Colors.white),
            style: IconButton.styleFrom(backgroundColor: Colors.blue),
          ),
          bottom: 0,
          right: 0,
        ),
      ],
    );
  }

  // story like facebook
  // Widget _buildStoryItem(String image) {
  //   return Container(
  //     width: 120,
  //     margin: EdgeInsets.only(right: 10),
  //     child: Image.network(image, fit: BoxFit.cover),
  //   );
  // }

  Widget _buildPostListViewuildPost() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _MovieAPi.length,
      itemBuilder: (context, index) {
        return _buildPostItem(_MovieAPi[index]);
      },
    );
  }

  Widget _buildPostItem(String image) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(10),
      child: Image.network(image, fit: BoxFit.cover),
    );
  }
}

//List<String> fakeImage = List.generate(20, (index) => faker.person.name());

List<String> _MovieAPi = [
  "https://www.gqmiddleeast.com/cloud/2023/11/09/u4LhmUOx-Screenshot-2023-11-09-at-12.25.09-PM-644x1024.png",
  "https://cineramble.com/wp-content/uploads/2024/05/furiosa.jpg",
  "https://terrell.filmalley.net/site-assets/movie-posters/_smallPoster2x/IF_ST-IMMERSIVE.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/398055860_688837486526142_8475637847272940667_n-820x1024.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/u4LhmUOx-Screenshot-2023-11-09-at-12.25.09-PM-644x1024.png",
  "https://cineramble.com/wp-content/uploads/2024/05/furiosa.jpg",
  "https://terrell.filmalley.net/site-assets/movie-posters/_smallPoster2x/IF_ST-IMMERSIVE.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/398055860_688837486526142_8475637847272940667_n-820x1024.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/u4LhmUOx-Screenshot-2023-11-09-at-12.25.09-PM-644x1024.png",
  "https://cineramble.com/wp-content/uploads/2024/05/furiosa.jpg",
  "https://terrell.filmalley.net/site-assets/movie-posters/_smallPoster2x/IF_ST-IMMERSIVE.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/398055860_688837486526142_8475637847272940667_n-820x1024.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/u4LhmUOx-Screenshot-2023-11-09-at-12.25.09-PM-644x1024.png",
  "https://cineramble.com/wp-content/uploads/2024/05/furiosa.jpg",
  "https://terrell.filmalley.net/site-assets/movie-posters/_smallPoster2x/IF_ST-IMMERSIVE.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/398055860_688837486526142_8475637847272940667_n-820x1024.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/u4LhmUOx-Screenshot-2023-11-09-at-12.25.09-PM-644x1024.png",
  "https://cineramble.com/wp-content/uploads/2024/05/furiosa.jpg",
  "https://terrell.filmalley.net/site-assets/movie-posters/_smallPoster2x/IF_ST-IMMERSIVE.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/398055860_688837486526142_8475637847272940667_n-820x1024.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/u4LhmUOx-Screenshot-2023-11-09-at-12.25.09-PM-644x1024.png",
  "https://cineramble.com/wp-content/uploads/2024/05/furiosa.jpg",
  "https://terrell.filmalley.net/site-assets/movie-posters/_smallPoster2x/IF_ST-IMMERSIVE.jpg",
  "https://www.gqmiddleeast.com/cloud/2023/11/09/398055860_688837486526142_8475637847272940667_n-820x1024.jpg",
];
