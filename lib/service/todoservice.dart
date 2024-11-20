import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/classtodo.dart';

class TodoService {
  final Todo todoCollection =
      FirebaseFirestore.instance.collection(Todo.collection);

  // Méthode pour ajouter un Todo
  Future<void> addTodo(Todo todo) async {
    try {
      await todoCollection.add(todo.toMap());
      print("Todo ajouté avec succès");
    } catch (e) {
      print("Erreur lors de l'ajout du todo: $e");
    }
  }

  // Méthode pour modifier un Todo
  Future<void> updateTodo(String id, Todo todo) async {
    try {
      await todoCollection.doc(id).update(todo.toMap());
      print("Todo modifié avec succès");
    } catch (e) {
      print("Erreur lors de la modification du todo: $e");
    }
  }

  // Méthode pour afficher tous les Todos
  Future<List<Todo>> getTodos() async {
    try {
      QuerySnapshot querySnapshot = await todoCollection.get();
      return querySnapshot.docs.map((doc) {
        return Todo.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Erreur lors de la récupération des todos: $e");
      return [];
    }
  }

  // Méthode pour supprimer un Todo
  Future<void> deleteTodo(String id) async {
    try {
      await todoCollection.doc(id).delete();
      print("Todo supprimé avec succès");
    } catch (e) {
      print("Erreur lors de la suppression du todo: $e");
    }
  }
}
