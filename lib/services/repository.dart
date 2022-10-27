import 'dart:convert';

import 'package:market/models/categorys_model.dart';
import 'package:http/http.dart' as http;
import 'package:market/providers/provider_notifier.dart';
import 'package:market/services/singleton.dart';

String endpointApi =
    "https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0";
//Variables for singletons
final List<CategorysStateBase> stateListBase = [
  CategoryState(),
];
CategoryState stateList = CategoryState();
ChangeForFilterProvider _setProvider = ChangeForFilterProvider();

class RepositoryFetch {
  Future<List<dynamic>?> fetchData() async {
    print("entered");
    final response = await http.get(Uri.parse(endpointApi));
    if (response.statusCode == 200) {
      for (final state in stateListBase) {
        // ignore: invalid_use_of_protected_member
        state.stateListCategory = json.decode(response.body)['data'];
      }
      _setProvider.chageForFilter = stateList.currentListAlertPet;
      // print("esta es la data :)  ${stateList.currentListAlertPet}");

      // return json.decode(response.body)["data"];
    } else {
      throw Exception('Failed to load post');
    }
  }
}
