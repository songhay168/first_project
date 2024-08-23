import 'package:flutter/material.dart';

import 'product_model.dart';

class FavoriteProductLogic extends ChangeNotifier {
  List<ProductModel> _favoriteProduct = [];
  List<ProductModel> get favoriteProduct => _favoriteProduct;

  void toggle(ProductModel item) {
    bool faved = isFavorite(item);
    if (faved) {
      remove(item);
    } else {
      add(item);
    }
  }

  void add(ProductModel item) {
    _favoriteProduct.add(item);
    notifyListeners();
  }

  void remove(ProductModel item) {
    _favoriteProduct.remove(item);
    notifyListeners();
  }

  bool isFavorite(ProductModel item) {
    return _favoriteProduct.contains(item);
  }

  int get numOfFavorite {
    return _favoriteProduct.length;
  }
}
