import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final List<String> _searchWords = [];
  List<String> get searchWords => _searchWords;

//Lista de palabras buscadas
  set searchWords(dynamic x) {
    _searchWords.add(x);
    notifyListeners();
  }
}