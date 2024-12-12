// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'loading_page.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(CareThruApp());
}

class CareThruApp extends StatelessWidget {
  // ignore: use_super_parameters
  const CareThruApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care Thru',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'MISTRAL', // Replace with your font family if needed.
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(), // Removed const
        '/login': (context) => LoginPage(), // Removed const
        '/home': (context) => HomePage(), // Removed const
      },
    );
  }
}
