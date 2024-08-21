import 'package:first_project/basic_modules/future(async_await)/product_model.dart';
import 'package:first_project/basic_modules/future(async_await)/product_service.dart';
import 'package:flutter/material.dart';

class ProductLogic extends ChangeNotifier {
  List<ProductModel> _fakeProduct = [];
  List<ProductModel> get fakeProduct => _fakeProduct;

  bool _loading = false;
  bool get loading => _loading;
  bool _view = false;
  bool get view => _view;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void toggleView() {
    _view = !_view;
    notifyListeners();
  }

  void enableLoading() {
    _loading = true;
    notifyListeners();
  }

  void disableLoading() {
    _loading = false;
    notifyListeners();
  }

  void fetch() async {
    enableLoading();
    try {
      _fakeProduct = await ProductService.fechData();

      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    disableLoading();
    notifyListeners();
  }

  bool _smallToBigSorted = true;
  bool get smallToBigSorted => _smallToBigSorted;

  void toggleSortByPrice() {
    if (_smallToBigSorted) {
      _fakeProduct.sort((x, y) => x.price.compareTo(y.price));
    } else {
      _fakeProduct.sort((x, y) => y.price.compareTo(x.price));
    }

    _smallToBigSorted = !_smallToBigSorted;

    notifyListeners();
  }
}
