import 'package:flutter/material.dart';
import 'package:market/models/categorys_model.dart';
import 'package:market/providers/provider_notifier.dart';
import 'package:market/screens/details_product.dart';
import 'package:market/utils/calculations.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<CategoryModel> filteredProducts = [];

  void fetchFilter(context, queryData, redirect) {
    final postModel = Provider.of<DataClass>(context, listen: false);
    print("ver fecthFilter");
    if (postModel.post != null) {
      for (var i = 0; i < postModel.post!.length; i++) {
        if (postModel.post![i].nombre.toString().contains(queryData)) {
          filteredProducts.add(postModel.post![i]);
        }
      }
    }
    if (filteredProducts.length != 0 && redirect == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (DetailsProduct(
                    redirect: true,
                    name: filteredProducts[0].nombre,
                    image: filteredProducts[0].imagen,
                    description: filteredProducts[0].descripcion,
                    price: numberFormat(filteredProducts[0].precio),
                    percentage: calculatePercentage(filteredProducts[0].precio,
                        filteredProducts[0].valorPromo),
                  ))));
    }
    // print("postModel fecthFilter ${filteredProducts}");
  }

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

    if (query.trim().length == 0) {
      return saveWords.saveSearchedWords != null &&
              saveWords.saveSearchedWords != [] &&
              saveWords.saveSearchedWords.length != 0
          ? Column(
              children: saveWords.saveSearchedWords.map((item) {
              return GestureDetector(
                  onTap: () =>
                      print("Container pressed"), // Handle your onTap here.
                  child: Card(child: ListTile(title: Text(item))));
            }).toList())
          : Center(child: Text("No hay datos"));
    }

    saveWords.saveSearchedWords.add(query);
    fetchFilter(context, query, false);
    // if (saveWords.saveSearchedWords.length == 0) {
    //   for (var i = 0; i < saveWords.saveSearchedWords.length; i++) {
    //     if (saveWords.saveSearchedWords[i].toString().contains(query)) {
    //       saveWords.saveSearchedWords[i].remove(query);
    //     }
    //   }
    // }

    // print("query ${query} and ${saveWords.saveSearchedWords}");

    // query!
    return filteredProducts != null &&
            filteredProducts != [] &&
            filteredProducts.length != 0
        ? Column(
            children: filteredProducts.map((item) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (DetailsProduct(
                                redirect: true,
                                name: item.nombre,
                                image: item.imagen,
                                description: item.descripcion,
                                price: numberFormat(item.precio),
                                percentage: calculatePercentage(
                                    item.precio, item.valorPromo),
                              ))));
                },
                child: Card(child: ListTile(title: Text(item.nombre))));
          }).toList())
        : Center(child: Text("No hay datos"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final saveWords = Provider.of<SaveSearchedWordsProvider>(context);
    // TODO: implement buildSuggestions
    return saveWords.saveSearchedWords != null &&
            saveWords.saveSearchedWords != [] &&
            saveWords.saveSearchedWords.length != 0
        ? Column(
            children: saveWords.saveSearchedWords.map((item) {
            return GestureDetector(
                onTap: () => {
                      query = item,
                      fetchFilter(context, item, true),
                      print("Container pressed ${query}")
                    }, // Handle your onTap here.
                child: Card(child: ListTile(title: Text(item))));
          }).toList())
        : Center(child: Text("No hay datos"));
  }
}
