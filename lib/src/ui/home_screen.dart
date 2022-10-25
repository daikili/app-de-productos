import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/categorys_model.dart';
import '../providers/provider_notifier.dart';
import 'package:http/http.dart' as http;

String endpointApi =
    "https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0";

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> data = [];

  CategoryModel? getData;

  Future<CategoryModel> fetchData() async {
    print("entered");
    final response = await http.get(Uri.parse(endpointApi));
    // print(response.body.toString());

    if (response.statusCode == 200) {
      return CategoryModel.fromJson(json.decode(response.body)['data']);
    }

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      // data.add(CategoryModel.fromJson(json.decode(response.body)));

      return CategoryModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    print("esta es la data :) ${getData?.categoria}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Popular Movies'),
        ),
        body: Stack(children: [Text("Hola mundo")]));
  }
}
