import 'package:scoped_model/scoped_model.dart';

class Product {
  final String name;
  final String price;
  bool isAdded;

  Product({required this.price,required this.name, this.isAdded = false});
}

class ProductModel extends Model {
  // Liste des produits
  final List<Product> _products = [
    Product(name: 'Biscuit', price: '1 USD'),
    Product(name: 'Stylo',price: '1.5 USD'),
    Product(name: 'Chargeur',price: '2 USD'),
  ];

  List<Product> get products => List.unmodifiable(_products);
  

  void toggleAdded(int index) {
    _products[index].isAdded = !_products[index].isAdded;
    notifyListeners(); 
  }

  // Méthode pour ajouter un nouveau produit
  void addProduct(String name,String price) {
    _products.add(Product(name: name, price: price));
    notifyListeners();
  }

  // Méthode pour supprimer un produit
  void removeProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }
}
