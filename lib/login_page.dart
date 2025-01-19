// ignore_for_file: avoid_print, library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'Doc@123' && password == 'carethru') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Invalid Credentials"),
            content: Text("Please enter the correct username and password."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Care Thru",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 176, 240),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  50), // Increased space between "Sign in" and "Username"
                          Container(
                            width: 300, // Set the desired width here
                            child: TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelText: "Username",
                                labelStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  20), // Space between "Username" and "Password"
                          Container(
                            width: 300, // Set the desired width here
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelText: "Password",
                                labelStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                              height:
                                  30), // Space between "Password" and button
                          Center(
                            // Align button to center
                            child: Container(
                              width: 120, // Set the desired width here
                              child: ElevatedButton(
                                onPressed: _signIn,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  backgroundColor:
                                      Colors.blue, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.zero, // Rectangular shape
                                  ),
                                ),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white, // Text color
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  50), // Space between button and "Forgot password"
                          Align(
                            alignment:
                                Alignment.centerRight, // Align to bottom right
                            child: GestureDetector(
                              onTap: () {
                                // Handle forgot password logic here
                                print("Forgot password tapped");
                              },
                              child: Text(
                                "Forgot password..?",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color.fromARGB(255, 32, 56, 100),
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Terms of use | Privacy . . .',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
