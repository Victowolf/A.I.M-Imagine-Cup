// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';
import 'package:csv/csv.dart'; // For CSV parsing
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'add_patient_dialog.dart';
import 'package:flutter/services.dart'; // For rootBundle to load assets

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> patients = [
    {
      'id': '101',
      'name': 'John Doe',
      'status': 'Ok',
      'device': 'connected',
      'room': '001',
    },
    {
      'id': '102',
      'name': 'Jane Smith',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '002',
    },
    {
      'id': '103',
      'name': 'Michael Brown',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '003',
    },
  ];

  Map<String, String>? selectedPatient;

  // ECG Graph Data
  List<FlSpot> ecgData = [FlSpot(0, 0)]; // Initialize with dummy data point
  int _counter = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    loadEcgData();
  }

  Future<void> loadEcgData() async {
    try {
      // Load the CSV file from assets
      final String csvData =
          await rootBundle.loadString('assets/ECGdemo/100.csv');
      final List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(csvData);

      List<double> rawEcg = [];
      for (var row in csvTable) {
        rawEcg.add(double.parse(row[0].toString()));
      }

      print('Loaded ${rawEcg.length} data points.');
      startEcgSimulation(rawEcg);
    } catch (e) {
      print('Error loading ECG data: $e');
    }
  }

  void startEcgSimulation(List<double> rawEcg) {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        ecgData
            .add(FlSpot(_counter.toDouble(), rawEcg[_counter % rawEcg.length]));
        _counter++;
      });

      if (ecgData.length > 1000) {
        ecgData.removeAt(0); // Maintain a sliding window of 500 points
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Patient Monitoring Dashboard',
            style: TextStyle(
              color: Colors.white, // Makes the text color white
              fontWeight: FontWeight.bold, // Makes the text bold
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 112, 192),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Patient List',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: patients.length,
                            itemBuilder: (context, index) {
                              final patient = patients[index];
                              return ListTile(
                                title: Text(patient['name']!),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      patient['status']!,
                                      style: TextStyle(
                                        color: patient['status'] == 'Ok'
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text('Device: ${patient['device']}'),
                                onTap: () {
                                  setState(() {
                                    selectedPatient = patient;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (_) => AddPatientDialog(
                                onAdd: (newPatient) {
                                  setState(() {
                                    patients.add(newPatient);
                                  });
                                },
                              ),
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Report',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        if (selectedPatient != null)
                          Text(
                            'Patient ID: ${selectedPatient!['id']}\n'
                            'Name: ${selectedPatient!['name']}\n'
                            'Status: ${selectedPatient!['status']}\n'
                            'Device: ${selectedPatient!['device']}\n'
                            'Room no: ${selectedPatient!['room']}',
                            style: TextStyle(fontSize: 16),
                          )
                        else
                          Text('Select a patient to view details.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    color: Colors.red[200],
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                            spots: ecgData,
                            isCurved: true,
                            color: const Color.fromARGB(255, 3, 0, 63),
                            barWidth: 2,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(show: false),
                            dotData: FlDotData(show: false),
                          ),
                        ],
                        minX: ecgData.first.x,
                        maxX: ecgData.last.x,
                        minY: -2,
                        maxY: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 150,
                    color: Colors.grey[200],
                    child: Center(child: Text('Analysis Section')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
