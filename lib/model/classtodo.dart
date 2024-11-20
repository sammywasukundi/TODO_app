//import 'package:flutter/foundation.dart';

class Todo {
  String id = '';
  String nameTodo = '';
  String descriptionTodo  = '';
  bool isAddedTodo;

  //Todo();
  Todo.withParam({required this.id, required this.nameTodo,required this.descriptionTodo, required this.isAddedTodo});

  Map<String, dynamic> toMap() => {
    'id' : id,
    'nameTodo' : nameTodo,
    'descriptionTodo' : descriptionTodo,
    'isAddedTodo' : isAddedTodo
  };

  factory Todo.fromMap(Map<String, dynamic> todos) => Todo.withParam(
    id : todos['id'],
    nameTodo: todos['nameTodo'],
    descriptionTodo: todos['descriptionTodo'],
    isAddedTodo: todos['isAddesTodo']
  );

  static const collection  = 'todoCollection';

  add(Map<String, dynamic> map) {}

  doc(String id) {}
}