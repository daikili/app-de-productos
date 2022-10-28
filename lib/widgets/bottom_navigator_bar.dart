import 'package:flutter/material.dart';
import 'package:market/screens/home_screen.dart';
import 'package:market/screens/others.dart';
import 'package:market/screens/profile.dart';
import 'package:market/screens/shopping.dart';

class MyBottomNavigatorBar extends StatefulWidget {
  const MyBottomNavigatorBar({super.key});

  @override
  State<MyBottomNavigatorBar> createState() => _MyBottomNavigatorBarState();
}

class _MyBottomNavigatorBarState extends State<MyBottomNavigatorBar> {
  Color homeColor = Colors.grey;
  Color searchColor = Colors.grey;
  Color detailColor = Colors.grey;
  Color profileColor = Colors.grey;
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Others(),
    Shopping(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.jpg',
          width: 250,
          height: 200,
        ),
        bottomOpacity: 0,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.widgets_outlined,
              ),
              label: 'Catálogo',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket,
              ),
              label: 'Carrito',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Perfil',
            backgroundColor: Colors.white,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        iconSize: 25,
        onTap: _onItemTapped,
        elevation: 5,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "regular",
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontFamily: "regular",
          color: Colors.grey,
        ),
      ),
    );
  }
}
