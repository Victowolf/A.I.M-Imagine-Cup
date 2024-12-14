import 'package:flutter/material.dart';
import 'main.dart';

class GptPage extends StatefulWidget {
  const GptPage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<GptPage> {
  final List<double> _voltages = [
    0.5,
    1.2,
    2.3,
    3.4,
    2.1,
    1.0,
    3.5,
    2.8,
    4.0,
    1.9
  ]; // Predefined voltage list
  String _feedback = '';

  @override
  void initState() {
    super.initState();
    _getFeedback(); // Automatically get feedback when the page is opened
  }

  void _getFeedback() async {
    final feedback = await getGPTFeedback(_voltages);
    setState(() {
      _feedback = feedback;
    });
  }

  @override
  Widget build(BuildContext context) {
    double boxWidth = 200;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ChatGpt',
          style: TextStyle(fontFamily: 'AGENCYR'),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/chatgptbg.png', // Path to your image
              fit: BoxFit.cover, // Makes the image cover the whole screen
            ),
          ),
          // Feedback Section
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: boxWidth, // Set the width to 200
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white
                    .withOpacity(0.8), // Semi-transparent background
              ),
              child: Text(
                _feedback.isEmpty ? 'No feedback yet.' : _feedback,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'AGENCYR',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
