

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// Modèle de produit
class Product {
  final String name;
  final String price;
  bool isAdded;

  Product({required this.price,required this.name, this.isAdded = false});
}

// Modèle pour gérer l'état de la liste des produits
class ProductModel extends Model {
  final List<Product> _products = [
    Product(name: 'Biscuit', price: '1 \$'),
    Product(name: 'Stylo',price: '1.5 \$'),
    Product(name: 'Chargeur',price: '2 \$'),
  ];

  List<Product> get products => _products;

  void toggleAdded(int index) {
    _products[index].isAdded = !_products[index].isAdded;
    notifyListeners();
  }
}

class MyProducts extends StatelessWidget {
  const MyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
      model: ProductModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mes produits'),
        ),
        body: ScopedModelDescendant<ProductModel>(
          builder: (context, child, model) {
            return ListView.builder(
              itemCount: model.products.length,
              itemBuilder: (context, index) {
                final product = model.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.price,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  trailing: ElevatedButton(
                    onPressed: () {
                      model.toggleAdded(index);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          product.isAdded ? Colors.red : Colors.green,
                      elevation: 2,
                      shape: const RoundedRectangleBorder()
                    ),
                    child: Text(
                      product.isAdded ? 'Retirer' : 'Ajouter',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
