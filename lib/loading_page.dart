import 'package:flutter/material.dart';
import 'dart:async';
import 'login_page.dart'; // Make sure to import your LoginPage

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Direct navigation to LoginPage if named routes are causing issues
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Baground.png'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Care Thru…',
            style: TextStyle(
              fontFamily: 'AGENCYR',
              fontSize: 48,
              fontWeight: FontWeight.normal,
              color: Colors.black, // Ensure text is visible on the background
            ),
          ),
        ),
      ),
    );
  }
}
