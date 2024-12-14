// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_declarations
import 'package:flutter/material.dart';
import 'loading_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'add_p.dart';
import 'gpt_page.dart'; // Import the Add Patient Page
import 'mongodb.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getGPTFeedback(List<double> voltages) async {
  final apiKey =
      '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'; // Replace with your API key
  final prompt =
      'Analyze the following voltage values per second and provide feedback: $voltages';

  try {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'text-davinci-003', // Use the desired GPT model
        'prompt': prompt,
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'].trim();
    } else {
      return 'Error: ${response.statusCode} ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'Failed to fetch feedback: $e';
  }
}

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
      debugShowCheckedModeBanner: false,
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
        '/gpt': (context) => GptPage(),
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
