import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListGrid_View extends StatefulWidget {
  const ListGrid_View({super.key});

  @override
  State<ListGrid_View> createState() => _ListGrid_ViewState();
}

class _ListGrid_ViewState extends State<ListGrid_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 235, 225, 228),
              const Color.fromARGB(255, 38, 68, 238),
            ],
          ),
        ),
      ),
      title: Text("List Grid View App"),
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(30),
      //   child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: _buildTopMenu(),
      //   ),
      // ),
    );
  }

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

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildPageView(),
        Positioned(
          top: 30,
          child: _buildForYouFowllowing(),
        )
      ],
    );
  }

  Widget _buildForYouFowllowing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text(
            "For You",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Text(
          "|",
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text(
            "Following",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Icon(Icons.search, color: Colors.white, size: 30),
      ],
    );
  }

  Widget _buildSlideShow() {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _MovieAPi.length,
        itemBuilder: (context, index) {
          return Image.network(
            _MovieAPi[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: _MovieAPi.length,
      itemBuilder: (context, index) {
        return _buildPageViewItem(_MovieAPi[index]);
      },
    );
  }

  Widget _buildPageViewItem(String image) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.network(image, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: _buildContenIcons(),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: _buildContenDescription(),
        ),
      ],
    );
  }

  Widget _buildContenDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Decscription",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          child: Text(
            "World's simplest browser-based utility for generating fake text. Load your text in the input form on the left, adjust the",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContenIcons() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.face,
            color: Colors.white,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.bookmark, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildGridViewBuilder() {
    return GridView.builder(
      itemCount: _MovieAPi.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 9 / 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Image.network(_MovieAPi[index], fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        scrollDirection: Axis.vertical,
        childAspectRatio: 9 / 16,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
        ]);
  }
}
