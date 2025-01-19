// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/material.dart';

class AddPatientDialog extends StatefulWidget {
  final Function(Map<String, String>) onAdd;

  AddPatientDialog({required this.onAdd});

  @override
  _AddPatientDialogState createState() => _AddPatientDialogState();
}

class _AddPatientDialogState extends State<AddPatientDialog> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController roomController = TextEditingController();

  void _validateAndAddPatient() {
    final id = idController.text;
    final name = nameController.text;
    final age = ageController.text;
    final weight = weightController.text;
    final room = roomController.text;

    if (id.isEmpty ||
        name.isEmpty ||
        age.isEmpty ||
        weight.isEmpty ||
        room.isEmpty) {
      _showErrorMessage('All fields are required.');
      return;
    }

    if (!_isNumeric(id) ||
        !_isNumeric(age) ||
        !_isNumeric(weight) ||
        !_isNumeric(room)) {
      _showErrorMessage('Patient ID, Age, Weight, and Room must be numerical.');
      return;
    }

    widget.onAdd({
      'id': id,
      'name': name,
      'status': 'Alert',
      'device': 'disconnected',
      'weight': '${weight}kg',
      'room': room,
    });
    Navigator.pop(context);
  }

  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Sharp edges
      ),
      title: Text(
        'Add Patient',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20), // Adds space between title and inputs
          TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Patient ID',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
          TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
          TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
          TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
          TextField(
              controller: roomController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Room',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
      actions: [
        Container(
          width: double.infinity, // Makes the button take the full width
          child: ElevatedButton(
            onPressed: _validateAndAddPatient,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Rectangular shape
              ),
            ),
            child: Center(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
