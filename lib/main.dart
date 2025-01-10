// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(CareThruApp());
}

class CareThruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
