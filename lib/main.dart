// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'loading_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'add_p.dart'; // Import the Add Patient Page
import 'mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(CareThruApp());
}

class CareThruApp extends StatelessWidget {
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
        '/': (context) => LoadingPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        'add_p': (context) => AddPatientPage(
              onAddPatient: (patient) {
                // Add your logic to handle new patients here if required
                print('Patient added: $patient');
              },
            ), // Pass the required parameter
      },
    );
  }
}
