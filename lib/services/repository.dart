import 'dart:convert';
import 'package:market/models/categorys_model.dart';
import 'package:http/http.dart' as http;

String endpointApi =
    "https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0";

class RepositoryFetch {
  Future<List<CategoryModel>?> getSinglePostData() async {
    List<CategoryModel> result = [];
    try {
      final response = await http.get(Uri.parse(endpointApi));
      if (response.statusCode == 200) {
        var item = json.decode(response.body)["data"];
        for (dynamic map in item) {
          result.add(CategoryModel.fromJson(json.decode(json.encode(map))));
        }
      } else {
        print("error");
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
