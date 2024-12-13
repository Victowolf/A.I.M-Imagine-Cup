// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'Doc@123' && password == 'carethru') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _errorMessage = 'Invalid credentials. Try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit
            .expand, // Makes the background image cover the entire screen
        children: [
          // Background Image
          Image.asset(
            'assets/loginbag.png', // Path to your background image
            fit: BoxFit.cover, // Ensure the image fills the entire screen
          ),
          // Foreground Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center children vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center children horizontally
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'AGENCYR',
                      fontSize: 48,
                      fontWeight: FontWeight.normal,
                      color: Colors
                          .black, // Ensures text is visible over the background
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Username TextField wrapped in a Container with width control
                  Container(
                    width:
                        200, // Set the width of the TextField container for username
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          fontFamily: 'AGENCYR',
                          color: Colors.black, // Ensures label text is visible
                        ),
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white), // Border color
                        ),
                      ),
                      style: const TextStyle(
                          fontFamily: 'AGENCYR',
                          fontSize: 20,
                          color: Colors.black), // Input text color
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password TextField wrapped in a Container with width control
                  Container(
                    width:
                        200, // Set the width of the TextField container for password
                    child: TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          fontFamily: 'AGENCYR',
                          color: Colors.black, // Ensures label text is visible
                        ),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white), // Border color
                        ),
                      ),
                      obscureText: true,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'AGENCYR',
                          color: Colors.black), // Input text color
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 92, 166),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'AGENCYR',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    child: const Text(
                      'Enter',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                      ),
                    ),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.red,
                          fontFamily: 'AGENCYR',
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
