import 'package:flutter/material.dart';
import 'package:market/models/categorys_model.dart';
import 'package:market/providers/provider_notifier.dart';
import 'package:market/screens/details_product.dart';
import 'package:market/utils/calculations.dart';
import 'package:provider/provider.dart';

//**------------------match finder------------------------------- **/
class CustomSearchDelegate extends SearchDelegate {
  List<CategoryModel> filteredProducts = [];
  @override
  String get searchFieldLabel => 'Buscar';
  //filter by name property
  void fetchFilter(context, queryData, redirect) {
    final postModel = Provider.of<DataClass>(context, listen: false);
    if (postModel.post != null) {
      for (var i = 0; i < postModel.post!.length; i++) {
        if (postModel.post![i].nombre.toString().contains(queryData)) {
          filteredProducts.add(postModel.post![i]);
        }
      }
    }
    //if redirect is true go to start
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
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //provider to save the history
    final saveWords = Provider.of<SaveSearchedWordsProvider>(context);
    //if there is no search it shows the history

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
          : const Center(child: Text("No hay datos"));
    }
    //I save my search word in the provider
    saveWords.saveSearchedWords.add(ucFirst(query));
    //filter for the query
    fetchFilter(context, ucFirst(query), false);

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
        : const Center(child: Text("No hay datos"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final saveWords = Provider.of<SaveSearchedWordsProvider>(context);
    //If there is no data I show my history and if the search does not match it shows "No data"
    return saveWords.saveSearchedWords != null &&
            saveWords.saveSearchedWords != [] &&
            saveWords.saveSearchedWords.length != 0
        ? Column(
            children: saveWords.saveSearchedWords.map((item) {
            return GestureDetector(
                onTap: () => {
                      query = item,
                      fetchFilter(context, ucFirst(item), true),
                      // print("Container pressed ${query}")
                    }, // Handle your onTap here.
                child: Card(child: ListTile(title: Text(item))));
          }).toList())
        : const Center(child: Text("No hay datos"));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.green,
        iconTheme: theme.primaryIconTheme
            .copyWith(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }
}
