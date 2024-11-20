// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:menu/model/model.dart';
// import 'package:menu/screens/aboutscreen.dart';
// import 'package:menu/screens/produit.dart';
// import 'package:scoped_model/scoped_model.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// void _showBasketDialog(BuildContext context, ProductModel model) {
//   final addedProducts =
//       model.products.where((product) => product.isAdded).toList();

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text("Mon panier"),
//         content: SizedBox(
//           width: double.maxFinite,
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: addedProducts.length,
//             itemBuilder: (context, index) {
//               final product = addedProducts[index];
//               return ListTile(
//                 title: Text(product.name),
//                 subtitle: Text("Prix : ${product.price}"),
//               );
//             },
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text("Fermer"),
//           ),
//         ],
//       );
//     },
//   );
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
//   static final List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Accueil',
//       style: optionStyle,
//     ),
//     MyProducts(),
//     Text(
//       'Client',
//       style: optionStyle,
//     ),
//     Text(
//       'A propos',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTppad(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               print("Paramètres appuyé");
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Récupération du modèle ProductModel
//               final model =
//                   ScopedModel.of<ProductModel>(context, rebuildOnChange: true);
//               // Appel de la fonction avec les arguments requis
//               _showBasketDialog(context, model);
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: _widgetOptions[_selectedIndex],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blueAccent,
//               ),
//               child: Text('Menus'),
//             ),
//             ListTile(
//               title: const Text('Accueil'),
//               selected: _selectedIndex == 0,
//               onTap: () {
//                 _onItemTppad(0);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Produits'),
//               selected: _selectedIndex == 1,
//               onTap: () {
//                 _onItemTppad(1);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Client'),
//               selected: _selectedIndex == 2,
//               onTap: () {
//                 _onItemTppad(2);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('A propos'),
//               selected: _selectedIndex == 3,
//               onTap: () {
//                 _onItemTppad(3);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const AnimatedContainerApp()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
