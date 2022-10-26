import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/models/categorys_model.dart';
import 'package:market/repository/repository.dart';
import 'package:market/screens/home_screen.dart';
import 'package:market/widgets/transition.dart';

class SearchValue extends StatefulWidget {
  @override
  State<SearchValue> createState() => _SearchValueState();
}

class _SearchValueState extends State<SearchValue> {
  TextEditingController textSearchController = TextEditingController();
  final _focusInput = FocusNode();
  List<CategoryModel> dataCategorys = [];
  RepositoryFetch fecthApi = RepositoryFetch();

  List<dynamic> getCategoryList() {
    List outputList =
        dataCategorys.where((o) => o.nombre == textSearchController).toList();
    print("outputList ${outputList}");
    return outputList;
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focusInput.hasFocus.toString()}");
  }

  @override
  void initState() {
    _focusInput.addListener(() {
      _onFocusChange();
    });
    super.initState();

    fecthApi.fetchData().then((result) {
      print("getCategoryList ${getCategoryList}");
      for (dynamic map in result) {
        setState(() {
          dataCategorys
              .add(CategoryModel.fromJson(json.decode(json.encode(map))));
        });
      }
    });
    if (dataCategorys != null && dataCategorys != []) {
      getCategoryList();
    }
  }

  @override
  void dispose() {
    _focusInput.dispose();
    _focusInput.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
        foregroundColor: Color.fromARGB(255, 155, 155, 155),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                print("presiono buscador");
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
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.blueGrey,
                        controller: textSearchController,
                        focusNode: _focusInput,
                        onChanged: (value) => setState(() {
                          print(
                              "categoria filter ${dataCategorys.where((oldValue) => textSearchController.toString() == (oldValue.nombre.toString()))}");
                        }),
                        decoration: InputDecoration(
                          hintText: "Escribe ...",
                          hintStyle: TextStyle(
                              fontFamily: 'regular',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                          border: InputBorder.none,
                          // border: OutlineInputBorder(),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
