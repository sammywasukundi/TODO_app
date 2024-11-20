// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _todoName = TextEditingController();
  final _todoDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.4,
        elevation: 4,
        scrolledUnderElevation: sqrt1_2,
        title: Text(
          'Ajoutez un TODO',
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _todoName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Ajoutez un TODO',
                        labelStyle: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w300)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _todoDescription,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Ajoutez une description',
                        labelStyle: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w300)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      'Ajouter',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
