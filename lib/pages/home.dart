// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:menu/pages/addtodo.dart';
import 'package:menu/pages/stat.dart';

class MyIndex extends StatefulWidget {
  const MyIndex({super.key, required this.title});

  final String title;

  @override
  State<MyIndex> createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Todos Page')),
    MyStat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        actions: [
          // Menu de tri
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              // Gérer la sélection
              print("Option de tri sélectionnée : $value");
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'all',
                  child: Text('Tout'),
                ),
                const PopupMenuItem<String>(
                  value: 'completed',
                  child: Text('Todo complet'),
                ),
                const PopupMenuItem<String>(
                  value: 'active',
                  child: Text('Todo actif'),
                ),
              ];
            },
          ),

          // Menu pour marquer tout complet / effacer tout
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz),
            onSelected: (value) {
              // Gérer la sélection
              if (value == 'mark_all') {
                print("Marquer tout comme complet");
              } else if (value == 'clear_all') {
                print("Effacer tout");
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'mark_all',
                  child: Text('Marquer tout complet'),
                ),
                const PopupMenuItem<String>(
                  value: 'clear_all',
                  child: Text('Effacer tout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stat',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTodo(),
              ));
        },
        child: const Icon(Icons.add,color: Colors.grey,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
