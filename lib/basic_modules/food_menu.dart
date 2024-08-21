import 'package:first_project/basic_modules/food_model.dart';
import 'package:first_project/basic_modules/food_screen_detail.dart';
import 'package:flutter/material.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({super.key});

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text("Food Menu",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.pink[500],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildListView();
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: (context, index) {
        return _buildItem(foodList[index]);
      },
    );
  }

  Widget _buildItem(FoodModel item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FoodScreenDetail(item),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200,
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          15.0), // Set your desired radius here
                    ),
                    width: 100,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(
                      "${item.time}",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${item.title}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                Spacer(),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${item.rate}",
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
          ],
        ),
      ),
    );
  }
}
