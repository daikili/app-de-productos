import 'package:flutter/material.dart';
import 'package:market/models/categorys_model.dart';
import 'package:market/providers/provider_notifier.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final saveWords = Provider.of<SaveSearchedWordsProvider>(context);
    final postModel = Provider.of<DataClass>(context, listen: false);

    if (query.trim().length == 0) {
      return saveWords.saveSearchedWords != null &&
              saveWords.saveSearchedWords != []
          ? Column(
              children: saveWords.saveSearchedWords.map((item) {
              return GestureDetector(
                  onTap: () {
                    print("Ontap :)");
                    query = item;
                  },
                  child: Card(child: ListTile(title: Text(item))));
            }).toList())
          : Center(child: Text("No hay datos"));
    }

    saveWords.saveSearchedWords.add(query);

    // if (saveWords.saveSearchedWords.length == 0) {
    //   for (var i = 0; i < saveWords.saveSearchedWords.length; i++) {
    //     if (saveWords.saveSearchedWords[i].toString().contains(query)) {
    //       saveWords.saveSearchedWords[i].remove(query);
    //     }
    //   }
    // }

    List<CategoryModel> filteredProducts = [];
    if (postModel.post != null) {
      for (var i = 0; i < postModel.post!.length; i++) {
        if (postModel.post![i].nombre.toString().contains(query)) {
          filteredProducts.add(postModel.post![i]);
        }
      }
    }

    print("query ${query} and ${saveWords.saveSearchedWords}");

    // query!
    return filteredProducts != null && filteredProducts != []
        ? Column(
            children: filteredProducts.map((item) {
            return Card(child: ListTile(title: Text(item.nombre)));
          }).toList())
        : Center(child: Text("No hay datos"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final saveWords = Provider.of<SaveSearchedWordsProvider>(context);
    // TODO: implement buildSuggestions
    return saveWords.saveSearchedWords != null &&
            saveWords.saveSearchedWords != []
        ? Column(
            children: saveWords.saveSearchedWords.map((item) {
            return Card(child: ListTile(title: Text(item)));
          }).toList())
        : Center(child: Text("No hay datos"));
    ;
  }
}
