import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/models/categorys_model.dart';
import 'package:market/services/repository.dart';

class CategoryProvider extends ChangeNotifier {
  final List<String> _searchWords = [];
  List<String> get searchWords => _searchWords;

//Lista de palabras buscadas
  set searchWords(dynamic x) {
    _searchWords.add(x);
    notifyListeners();
  }
}

//provider for model CategoryModel
class DataClass extends ChangeNotifier {
  List<CategoryModel>? post;
  bool loading = false;
  RepositoryFetch fetch = RepositoryFetch();
  getPostData() async {
    loading = true;
    post = (await fetch.getSinglePostData());
    loading = false;
    notifyListeners();
  }
}

class SaveSearchedWordsProvider extends ChangeNotifier {
  final List<dynamic> _saveSearchedWords = [];
  List<dynamic> get saveSearchedWords => _saveSearchedWords;

//Lista de palabras buscadas
  set saveSearchedWords(List<dynamic> x) {
    // print("valor recibido _saveSearchedWords ${x}");
    _saveSearchedWords.add(x);
    notifyListeners();
  }
}
