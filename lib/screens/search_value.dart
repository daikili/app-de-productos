import 'package:flutter/material.dart';
import 'package:market/screens/home_screen.dart';
import 'package:market/widgets/transition.dart';

class SearchValue extends StatefulWidget {
  @override
  State<SearchValue> createState() => _SearchValueState();
}

class _SearchValueState extends State<SearchValue> {
  @override
  void initState() {
    super.initState();
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
            ),
          ],
        ),
      ),
    );
  }
}
