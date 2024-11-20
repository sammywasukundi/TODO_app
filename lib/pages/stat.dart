// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStat extends StatefulWidget {
  const MyStat({super.key});

  @override
  State<MyStat> createState() => _MyStatState();
}

class _MyStatState extends State<MyStat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('Todos complets',style: GoogleFonts.tomorrow(
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),),
            ),
            SizedBox(width: 20.0,),
            Center(
              child: Text('Todos actifs',style: GoogleFonts.tomorrow(
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),),
            )
          ],
        ),
      ),
    );
  }
}