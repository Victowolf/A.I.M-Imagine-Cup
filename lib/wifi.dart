// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_print, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WiFiStatus extends StatefulWidget {
  final ValueChanged<bool>?
      onStatusChanged; // Callback to notify parent about status changes

  const WiFiStatus({this.onStatusChanged});

  @override
  _WiFiStatusState createState() => _WiFiStatusState();
}

class _WiFiStatusState extends State<WiFiStatus> {
  bool active = false; // Store the active state
  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchStatus(); // Initial fetch
    timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => fetchStatus()); // Fetch every second
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> fetchStatus() async {
    try {
      // Replace with your ESP32's IP address
      final response = await http.get(Uri.parse("http://192.168.1.200/status"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          active = data['active'];
        });
        widget.onStatusChanged?.call(active); // Notify parent of the change
      } else {
        print("Failed to fetch status: ${response.statusCode}");
        setState(() {
          active = false;
        });
        widget.onStatusChanged?.call(active); // Notify parent of the change
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/homebg.png'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
