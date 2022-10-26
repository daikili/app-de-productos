import 'dart:convert';

import 'package:market/models/categorys_model.dart';
import 'package:http/http.dart' as http;

String endpointApi =
    "https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0";

class RepositoryFetch {
  Future<List<dynamic>> fetchData() async {
    print("entered");
    final response = await http.get(Uri.parse(endpointApi));
    if (response.statusCode == 200) {
      return json.decode(response.body)["data"];
    } else {
      throw Exception('Failed to load post');
    }
  }
}
