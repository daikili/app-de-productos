import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/screens/details_product.dart';
import 'package:market/services/repository.dart';
import 'package:market/utils/calculations.dart';
import 'package:market/widgets/search.dart';
import 'package:provider/provider.dart';
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
  List<dynamic> data = [];
  List<CategoryModel> dataCategorys = [];
  RepositoryFetch fecthApi = RepositoryFetch();
  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final postModel = Provider.of<DataClass>(context);
    var len = postModel.post?.length ?? 0;
    print("postModel ${postModel.post?[0].categoria}");
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Popular Movies'),
        // ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(alignment: Alignment.topCenter, children: [
              dataCategorys == null || dataCategorys == []
                  ? const Center(
                      heightFactor: 20,
                      child: CircularProgressIndicator(
                        color: Colors.green,
                        strokeWidth: 6,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.1,
                        right: size.width * 0.01,
                        left: size.width * 0.01,
                        bottom: size.height * 0.06,
                      ),
                      child: SizedBox(
                        width: size.width,
                        child: Column(children: [
                          //*******************SEARCH*************** */
                          Search(),
                          //******************* END SEARCH*************** */

                          //*******************ITERATE CARDS*************** */
                          Wrap(
                              spacing: 26, // gap between adjacent chips
                              runSpacing: 20, // gap between lines
                              children: <Widget>[
                                for (var i = 0; i < len; i++)
                                  GestureDetector(
                                    onTap: () {
                                      print("valor i $i");
                                      print(
                                          "valor  postModel.post?[i].nombre ${postModel.post?[i].nombre}");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  (DetailsProduct(
                                                    name: postModel
                                                        .post![i].nombre,
                                                    image: postModel
                                                        .post![i].imagen,
                                                    description: postModel
                                                        .post![i].descripcion,
                                                    price: numberFormat(
                                                        postModel
                                                            .post![i].precio),
                                                    percentage:
                                                        calculatePercentage(
                                                            postModel.post![i]
                                                                .precio,
                                                            postModel.post![i]
                                                                .valorPromo),
                                                  ))));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: size.width * 0.42,
                                      height: size.height * 0.31,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                143, 206, 206, 206),
                                            blurRadius: 3,
                                            spreadRadius: 0,
                                            offset: Offset(1.0,
                                                0), // shadow direction: bottom right
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: size.height * 0.01),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      postModel.post![i].imagen,
                                                      width: size.width * 0.30,
                                                      height:
                                                          size.height * 0.15,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  )),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.only(
                                                    top: size.height * 0.12),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                    "${postModel.post?[i].valorPromo} %",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Column(
                                              children: [
                                                Text(
                                                  postModel.post![i].nombre,
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015),
                                                ),
                                                Text(
                                                  "${numberFormat(postModel.post![i].precio)} COP",
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationThickness: 2,
                                                      fontSize: 12,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${calculatePercentage(postModel.post![i].precio, postModel.post![i].valorPromo)} COP",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.03,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  print("presiono a favoritos");
                                                },
                                                child: const Icon(
                                                  Icons.favorite,
                                                  color: Color.fromARGB(
                                                      255, 190, 190, 190),
                                                  size: 20,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print(
                                                      "presiono a carrito de compras");
                                                },
                                                child: const Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  color: Color.fromARGB(
                                                      255, 190, 190, 190),
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                              ]),
                        ]),
                      ))
            ])));
  }
}
