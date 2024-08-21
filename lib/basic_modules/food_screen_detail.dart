import 'package:first_project/basic_modules/food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodScreenDetail extends StatefulWidget {
  //const FoodScreenDetail({super.key});

  FoodModel item;

  FoodScreenDetail(this.item);

  @override
  State<FoodScreenDetail> createState() => _FoodScreenDetailState();
}

class _FoodScreenDetailState extends State<FoodScreenDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 245, 245),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 251, 245, 245),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_outline),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
      ],
    );
  }

  Widget _buildSubMenu() {
    return GridView.builder(
      itemCount: foodList.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 9 / 9,
      ),
      itemBuilder: (context, index) {
        return _buildItem(foodList[index]);
      },
    );
  }

  Widget _buildItem(FoodModel item) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(item.image),
            fit: BoxFit.cover,
          ),
        )),
        Positioned(
          child: IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.add, color: const Color.fromARGB(255, 0, 0, 0)),
            style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 252, 252, 252)),
          ),
          bottom: 0,
          right: 0,
        ),
      ],
    );
    // child: Image.network(
    //   item.image,
    //   fit: BoxFit.fitHeight,
    //   width: 5,
    // ));
  }

  Widget _buildBodyContain() {
    return Card(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${this.widget.item.title}",
              style: TextStyle(
                color: Color.fromARGB(255, 9, 9, 9),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${this.widget.item.des}",
              style: TextStyle(
                color: const Color.fromARGB(255, 9, 9, 9),
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.star_outline,
                    color: const Color.fromARGB(255, 6, 6, 6)),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${this.widget.item.rate}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Price: ${this.widget.item.price}",
              style: TextStyle(
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Delevery Time: ${this.widget.item.time}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Poppular",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "poppins",
                        fontSize: 20),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Rice Dishes",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "poppins",
                        fontSize: 20),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Add Ons",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "poppins",
                        fontSize: 20),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubListMenu() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        _buildSubMenu(),
      ],
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: BouncingScrollPhysics(),
      //scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.maxFinite,
            height: 300,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(this.widget.item.image, fit: BoxFit.fill)),
          ),
        ),
        _buildBodyContain(),
        _buildSubMenu(),
      ],
    );
  }
}
