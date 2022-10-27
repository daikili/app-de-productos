import 'package:flutter/material.dart';

abstract class CategorysStateBase {
  @protected
  late List<dynamic> listCategory;
  @protected
  late List<dynamic> stateListCategory;

  List<dynamic> get currentListAlertPet => stateListCategory;

  // ignore: use_setters_to_change_properties
  void setStateListAlertsPets(List<dynamic> v) {
    stateListCategory.addAll(v);
  }

  void reset() {
    stateListCategory = listCategory;
  }
}

class CategoryState extends CategorysStateBase {
  static final CategoryState _instance = CategoryState._internal();

  factory CategoryState() {
    return _instance;
  }

  CategoryState._internal() {
    listCategory = [];
    stateListCategory = listCategory;
  }
}
