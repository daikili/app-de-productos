import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/screens/search_value.dart';
import 'package:market/search/search_delegate.dart';
import 'package:market/widgets/transition.dart';
import '../models/categorys_model.dart';
import '../providers/provider_notifier.dart';
import 'package:http/http.dart' as http;

String endpointApi =
    "https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0";

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: CustomSearchDelegate());
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.only(bottom: 25),
        width: size.width * 0.80,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(143, 206, 206, 206),
              blurRadius: 3,
              spreadRadius: 0,
              offset: Offset(1.0, 0), // shadow direction: bottom right
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Buscar",
              style: TextStyle(
                color: Color.fromARGB(255, 190, 190, 190),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                color: Color.fromARGB(255, 190, 190, 190),
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
