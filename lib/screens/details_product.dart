import 'package:flutter/material.dart';
import 'package:market/screens/home_screen.dart';
import 'package:market/widgets/bottom_navigator_bar.dart';

class DetailsProduct extends StatefulWidget {
  bool redirect;
  String name;
  String image;
  String description;
  String price;
  double percentage;

  DetailsProduct(
      {required this.redirect,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.percentage})
      : super();

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  int quantity = 0;
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => {
                    print("go back"),
                    if (widget.redirect == false)
                      {
                        Navigator.of(context).pop(),
                      }
                    else
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    (const MyBottomNavigatorBar()))),
                      }
                  }),
          foregroundColor: const Color.fromARGB(255, 155, 155, 155),
          title: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
            child: Text(widget.name),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Center(
                child: Column(
                  children: [
                    widget.image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width * 0.50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : const CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    widget.image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.10,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : const CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(8.0, 10.0),
                                blurRadius: 10,
                                spreadRadius: 2)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          children: [
                            widget.name != null
                                ? Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05),
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.55,
                                            child: Text(
                                              widget.name,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      favorite == false
                                          ? GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  favorite = true;
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.65,
                                                    top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.05),
                                                child: const Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  favorite = false;
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.65,
                                                    top: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.05),
                                                child: const Icon(
                                                  Icons.favorite_rounded,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            )
                                    ],
                                  )
                                : const CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.description,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.47),
                              child: Text(
                                "${widget.price} COP",
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2,
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.42),
                              child: Text(
                                "${widget.percentage} COP",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.65,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(8.0, 10.0),
                                        blurRadius: 20,
                                        spreadRadius: 3)
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.12,
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          if (quantity > 0) {
                                            setState(() {
                                              quantity = quantity - 1;
                                            });
                                          }
                                        },
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.10,
                                            child: const Icon(
                                                Icons.keyboard_arrow_down))),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text('$quantity'),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                        },
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.10,
                                            child: const Icon(
                                                Icons.keyboard_arrow_up)))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: const BorderSide(
                                      color: Colors.green,
                                      width: 1,
                                    ),
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        MediaQuery.of(context).size.height *
                                            0.07)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.shopping_basket),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Añadir al carrito")
                                  ],
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
