// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class AddPatientPage extends StatefulWidget {
  final Function(Map<String, String>) onAddPatient; // Callback function

  const AddPatientPage({Key? key, required this.onAddPatient})
      : super(key: key);

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  final TextEditingController _srnoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _massController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();

  void _addPatient() {
    final srno = _srnoController.text;
    final name = _nameController.text;
    final surname = _surnameController.text;
    final age = _ageController.text;
    final mass = _massController.text;
    final room = _roomController.text;

    if (srno.isEmpty ||
        name.isEmpty ||
        surname.isEmpty ||
        age.isEmpty ||
        mass.isEmpty ||
        room.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    // Create a new patient entry
    final newPatient = {
      'srno': srno,
      'name': name,
      'surname': surname,
      'age': age,
      'mass': mass,
      'room': room,
      'status': 'Alert',
      'device': 'disconnected',
    };

    widget.onAddPatient(newPatient); // Update the list in the Home Page
    Navigator.pop(context); // Navigate back after adding patient
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Back',
          style: TextStyle(
            fontFamily: 'AGENCYR',
            fontSize: 48,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/loginbag.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add Patient',
                  style: TextStyle(
                    fontFamily: 'AGENCYR',
                    fontSize: 48,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _srnoController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'AGENCYR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Serial Number',
                      labelStyle: TextStyle(
                        fontFamily: 'AGENCYR',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: 'AGENCYR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontFamily: 'AGENCYR',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _surnameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: 'AGENCYR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Surname',
                      labelStyle: TextStyle(
                        fontFamily: 'AGENCYR',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'AGENCYR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      labelStyle: TextStyle(
                        fontFamily: 'AGENCYR',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _massController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'AGENCYR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Mass',
                      labelStyle: TextStyle(
                        fontFamily: 'AGENCYR',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _roomController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontFamily: 'AGENCYR',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Room',
                      labelStyle: TextStyle(
                        fontFamily: 'AGENCYR',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _addPatient,
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontFamily: 'AGENCYR',
                        color: Colors.black,
                        fontSize: 36,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
