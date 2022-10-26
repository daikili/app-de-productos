import 'package:flutter/material.dart';

class DetailsProduct extends StatefulWidget {
  String name;
  String image;
  String description;
  String price;
  double percentage;

  DetailsProduct(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.percentage})
      : super();

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    print("llego ${widget.name}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 250, 250),
          elevation: 0,
          foregroundColor: Color.fromARGB(255, 155, 155, 155),
          title: Text("${widget.name}"),
        ),
        body: Container());
  }
}
