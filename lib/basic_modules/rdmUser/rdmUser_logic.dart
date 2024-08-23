import 'package:first_project/basic_modules/rdmUser/rdmUser_service.dart';
import 'package:flutter/material.dart';

import 'rdmUser_Model.dart';

class RdmUserLogic extends ChangeNotifier {
  RdmUserModel _fakeUser = RdmUserModel(
    results: [],
    info: Info(seed: "", results: 0, page: 0, version: ""),
  );
  RdmUserModel get fakeUser => _fakeUser;

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
      _fakeUser = await RdmUserService.fechData();

      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    disableLoading();
    notifyListeners();
  }
}
