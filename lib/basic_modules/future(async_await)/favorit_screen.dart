import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_product_logic.dart';
import 'product_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildListView();
  }

  Widget _buildListView() {
    List<ProductModel> items =
        context.watch<FavoriteProductLogic>().favoriteProduct;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(ProductModel item) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (diss) {
        if (diss == DismissDirection.endToStart) {
          context.read<FavoriteProductLogic>().remove(item);
        }
      },
      child: Card(
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: item.image,
            placeholder: (x, y) => Container(color: Colors.grey),
            errorWidget: (x, y, z) => Container(color: Colors.grey[900]),
          ),
          title: Text("${item.title}"),
          subtitle: Text("${item.price}"),
          trailing: Text("${item.rating.rate}/5"),
        ),
      ),
    );
  }
}
