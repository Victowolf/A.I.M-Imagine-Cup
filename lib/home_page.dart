// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'add_p.dart';
import 'wifi.dart';
// For ECG graph

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

List<double> _spots = [0, 0.1, 1, 0.0, -0.25, 0.0, 0.1, 0.5, 0.0, -0.3];
List<FlSpot> flSpots = List.generate(
  _spots.length,
  (index) => FlSpot(index.toDouble(), _spots[index]),
);

class HomePageState extends State<HomePage> {
  final List<Map<String, String>> _patients = [
    {
      'srno': '1',
      'name': 'Matthew',
      'surname': 'Tropp',
      'age': '35',
      'mass': '68kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '001'
    },
    {
      'srno': '2',
      'name': 'Jhonthan',
      'surname': 'Doen',
      'age': '50',
      'mass': '72kg',
      'status': 'OK',
      'device': 'Simulated',
      'room': '002'
    },
    {
      'srno': '3',
      'name': 'Johana',
      'surname': 'khels',
      'age': '42',
      'mass': '73kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '003'
    },
    {
      'srno': '4',
      'name': 'Jhon',
      'surname': 'Carter',
      'age': '32',
      'mass': '67kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '004'
    },
    {
      'srno': '5',
      'name': 'Emily',
      'surname': 'Smith',
      'age': '60',
      'mass': '73kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '005'
    },
    {
      'srno': '6',
      'name': 'Sophia',
      'surname': 'Davis',
      'age': '42',
      'mass': '93kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '006'
    },
    {
      'srno': '7',
      'name': 'James',
      'surname': 'Brown',
      'age': '80',
      'mass': '53kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '007'
    },
    {
      'srno': '8',
      'name': 'Olivia',
      'surname': 'Wilson',
      'age': '42',
      'mass': '73kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '008'
    },
    {
      'srno': '9',
      'name': 'William',
      'surname': 'Taylor',
      'age': '42',
      'mass': '73kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '009'
    },
    {
      'srno': '10',
      'name': 'Henry',
      'surname': 'Jackson',
      'age': '42',
      'mass': '73kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '010'
    },
    {
      'srno': '11',
      'name': 'Amlia',
      'surname': 'White',
      'age': '42',
      'mass': '73kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '011'
    },
    {
      'srno': '8',
      'name': 'Olivia',
      'surname': 'Wilson',
      'age': '42',
      'mass': '73kg',
      'status': 'Alert',
      'device': 'disconnected',
      'room': '012'
    },
    // Add more patients here
  ];

  // Method to update the device status
  void updateDeviceStatus(bool active) {
    setState(() {
      _patients[0]['device'] = active ? 'connected' : 'disconnected';
      _patients[0]['status'] = active ? 'OK' : 'Alert';
    });
  }

  Map<String, String>? _selectedPatient;

  @override
  void initState() {
    super.initState();
    _selectedPatient = _patients[0];
  }

  void addPatient(Map<String, String> newPatient) {
    setState(() {
      _patients.add(newPatient);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/homebg.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Wi-Fi Status widget
          WiFiStatus(onStatusChanged: updateDeviceStatus),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Care Thru…',
                  style: TextStyle(
                    fontFamily: 'AGENCYR',
                    fontSize: 55,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    // Patients Section
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                            child: Text(
                              'Patients',
                              style: TextStyle(
                                fontFamily: 'AGENCYR',
                                fontSize: 38,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _patients.length,
                              itemBuilder: (context, index) {
                                final patient = _patients[index];
                                return ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0,
                                        0.0,
                                        250.0,
                                        0.0), // Adjust padding for the background
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/listbg.png'), // Replace with your image path
                                          fit: BoxFit
                                              .contain, // Ensures the image fits properly
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            10), // Optional: Adds rounded corners
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 10.0, 8.0, 0.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  patient['srno']! + ']',
                                                  style: const TextStyle(
                                                    fontFamily: 'AGENCYR',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(width: 110),
                                                Text(
                                                  patient['name']! +
                                                      ' ' +
                                                      patient['surname']!,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'AGENCYR',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(width: 180),
                                                Text(
                                                  patient['status']!,
                                                  style: TextStyle(
                                                    fontFamily: 'AGENCYR',
                                                    color: patient['status'] ==
                                                            'OK'
                                                        ? Colors.green
                                                        : Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      123.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    patient['device']!,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'AGENCYR',
                                                      color:
                                                          patient['device'] ==
                                                                  'connected'
                                                              ? Colors.green
                                                              : Colors.red,
                                                    ),
                                                  ),
                                                  Text(
                                                    patient[
                                                        'room']!, // New Room Number Text
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'AGENCYR',
                                                      color: Colors.black,
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
                                  onTap: () {
                                    setState(() {
                                      _selectedPatient = patient;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(670.0, 0.0, 0.0,
                                20.0), // Adjust this value for more spacing
                            child: FloatingActionButton(
                              onPressed: () {
                                // Pass the addPatient function to AddPatientPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddPatientPage(
                                      onAddPatient: addPatient,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(color: Colors.white, width: 0),

                    // Report Section-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Report',
                              style: TextStyle(
                                fontFamily: 'AGENCYR',
                                fontSize: 38,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (_selectedPatient != null) ...[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(300.0, 20.0,
                                    16.0, 0.0), // Adjust padding as needed
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Name:',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' ${_selectedPatient!['name']} ${_selectedPatient!['surname']}',
                                          style: const TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.red,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        const Text(
                                          'Age:',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' ${_selectedPatient!['age']}',
                                          style: const TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                        height:
                                            8), // Add some space between rows
                                    Row(
                                      children: [
                                        const Text(
                                          'Status:',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' ${_selectedPatient!['status']}',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color:
                                                _selectedPatient!['status'] ==
                                                        'OK'
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        const Text(
                                          'Body W.T:',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' ${_selectedPatient!['mass']}',
                                          style: const TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                        height:
                                            8), // Add some space between rows
                                    Row(
                                      children: [
                                        const Text(
                                          'Device:',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' ${_selectedPatient!['device']}',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color:
                                                _selectedPatient!['device'] ==
                                                        'connected'
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                        height:
                                            8), // Add some space between rows
                                    Row(
                                      children: [
                                        const Text(
                                          'Room No:',
                                          style: TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' ${_selectedPatient!['room']}',
                                          style: const TextStyle(
                                            fontFamily: 'AGENCYR',
                                            fontSize: 18,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              if (_selectedPatient!['device'] == 'Simulated' ||
                                  _selectedPatient!['device'] ==
                                      'connected') ...[
                                const SizedBox(height: 60),
                                const Text(
                                  'ECG Data',
                                  style: TextStyle(
                                    fontFamily: 'AGENCYR',
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        180.0,
                                        0.0,
                                        130.0,
                                        50.0), // Adjust the padding value as needed
                                    child: LineChart(
                                      LineChartData(
                                        gridData: FlGridData(show: false),
                                        titlesData: FlTitlesData(
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize:
                                                  40, // Space for Y-axis labels
                                              interval:
                                                  1, // Adjust as per your scale
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  value.toStringAsFixed(
                                                      1), // Format labels
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                );
                                              },
                                            ),
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize:
                                                  40, // Space for X-axis labels
                                              interval:
                                                  1, // Adjust as per your scale
                                              getTitlesWidget: (value, meta) {
                                                return Text(
                                                  value.toStringAsFixed(
                                                      0), // Format labels
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                );
                                              },
                                            ),
                                          ),
                                          rightTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                          topTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                        ),
                                        borderData: FlBorderData(show: true),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: flSpots,
                                            isCurved: true,
                                            color:
                                                _selectedPatient!['device'] ==
                                                        'connected'
                                                    ? Colors.white
                                                    : Colors.grey,
                                            barWidth: 4,
                                            isStrokeCapRound: true,
                                            dotData: FlDotData(show: false),
                                            belowBarData:
                                                BarAreaData(show: false),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
