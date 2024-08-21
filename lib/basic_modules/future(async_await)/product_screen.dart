import 'dart:ffi';

import 'package:first_project/basic_modules/future(async_await)/product_logic.dart';
import 'package:first_project/basic_modules/future(async_await)/product_model.dart';
import 'package:first_project/basic_modules/future(async_await)/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(Duration(seconds: 1), () {
        context.read<ProductLogic>().enableLoading();
        context.read<ProductLogic>().fetch();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 1 Screen"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                context.read<ProductLogic>().toggleView();
              },
              icon: context.watch<ProductLogic>().view
                  ? Icon(Icons.list)
                  : Icon(Icons.grid_view)),
          IconButton(
              onPressed: () {
                context.read<ProductLogic>().toggleSortByPrice();
              },
              icon: Icon(Icons.sort_by_alpha)),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Hello"),
                ),
              );
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    bool loading = context.watch<ProductLogic>().loading;
    String? errorMessage = context.watch<ProductLogic>().errorMessage;

    debugPrint("loading: $loading");

    if (loading) {
      return Center(child: CircularProgressIndicator());
    } else if (errorMessage != null) {
      {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(errorMessage),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProductLogic>().fetch();
                },
                child: Text("Retry"),
              ),
            ],
          ),
        );
      }
    } else {
      List<ProductModel> items = context.watch<ProductLogic>().fakeProduct;
      return _buildData(items);
    }
  }
  // Widget _buildBody() {
  //   return Center(
  //     child: FutureBuilder<List<ProductModel>>(
  //       future: ProductService.fechData(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           return _buildData(snapshot.data);
  //         } else {
  //           return CircularProgressIndicator();
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildData(List<ProductModel>? products) {
    if (products == null) {
      return Center(
        child: Text("Something went wrong"),
      );
    }
    if (context.watch<ProductLogic>().view) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<ProductLogic>().fetch();
        },
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildItemGrid(products[index]);
          },
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<ProductLogic>().fetch();
        },
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildItemList(products[index]);
          },
        ),
      );
    }
  }

  Widget _buildItemList(ProductModel item) {
    return Slidable(
      key: ValueKey(0),
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              debugPrint("Share");
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (ctx) {
              debugPrint("Delete");
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Delete',
          ),
          SlidableAction(
            flex: 1,
            onPressed: (ctx) {
              debugPrint("Edit");
            },
            backgroundColor: Color(0xFF6FED79),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: CachedNetworkImage(
              imageUrl: item.image,
              placeholder: (x, y) => Container(
                color: Colors.grey,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // Image.network(
            //   item.image,
            //   fit: BoxFit.cover,
            // ),
          ),
          title: Text(item.title),
          subtitle: Text("USD ${item.price}"),
          trailing: Text("${item.rating.rate}/5"),
        ),
      ),
    );
  }

  Widget _buildItemGrid(ProductModel item) {
    return Card(
      elevation: 5, // Adds shadow for depth
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15), // Rounded corners for a modern look
      ),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          // Add any onTap action here
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Add padding inside the card
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Rounded corners for the image
                child: SizedBox(
                  width: 60, // Increased image size for better visibility
                  height: 60,
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10), // Spacing between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis, // Ensures long titles don't overflow
                    ),
                    SizedBox(height: 5),
                    Text(
                      "USD ${item.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${item.rating.rate}/5",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ), // A small arrow to indicate more details can be seen
            ],
          ),
        ),
      ),
    );
  }
}
