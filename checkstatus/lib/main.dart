import 'package:checkstatus/screens/homeadmin.dart';
import 'package:checkstatus/screens/homecliente.dart';
import 'package:flutter/material.dart';
import 'package:checkstatus/screens/estatuscliente.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminScreen(),
    );
  }
}

