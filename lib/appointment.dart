import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Import for DateFormat

class DoctorAppointmentPage extends StatefulWidget {
  @override
  _DoctorAppointmentPageState createState() => _DoctorAppointmentPageState();
}

class _DoctorAppointmentPageState extends State<DoctorAppointmentPage> {
  DateTime? _selectedDateTime;
  String? _selectedDoctor;

  final List<Map<String, String>> doctors = [
    {'name': 'Dr. Shahriar', 'specialization': 'AI Diagnostics Specialist'},
    {'name': 'Dr. Ahmed', 'specialization': 'Neural Network Analyst'},
    {'name': 'Dr. Shovo', 'specialization': 'Predictive Health Expert'},
    {'name': 'Dr. Siam', 'specialization': 'AI Diagnostics Specialist'},
    {'name': 'Dr. Mim', 'specialization': 'Neural Network Analyst'},
    {'name': 'Dr. Abir', 'specialization': 'Predictive Health Expert'},
    {'name': 'Dr. Rabbi', 'specialization': 'AI Diagnostics Specialist'},
    {'name': 'Dr. Raj Patel', 'specialization': 'Neural Network Analyst'},
    {'name': 'Dr. Kajol', 'specialization': 'Predictive Health Expert'},
  ];

  Future<void> _pickDateTime() async {
    // Pick Date
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Pick Time
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctor Appointment")),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://i.postimg.cc/MKQQfQDt/how-to-build-a-doctor-appointment-app-for-yo-format-jpeg-jpg11.jpg',
              fit: BoxFit.cover,
              color: Colors.white.withAlpha(217),
              colorBlendMode: BlendMode.lighten,
            ),
          ),

          // Foreground content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Doctor:', style: TextStyle(fontSize: 18)),
                  DropdownButton<String>(
                    value: _selectedDoctor,
                    hint: Text('Select a doctor'),
                    isExpanded: true,
                    items: doctors.map((doc) {
                      return DropdownMenuItem<String>(
                        value: doc['name'],
                        child: Text('${doc['name']} (${doc['specialization']})'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedDoctor = val),
                  ),
                  SizedBox(height: 24),

                  Text('Appointment Time:', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _selectedDateTime != null
                                ? DateFormat('dd MMM yyyy, hh:mm a').format(_selectedDateTime!)
                                : 'Tap to select date & time.',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.grey),
                          onPressed: _pickDateTime,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selectedDoctor != null && _selectedDateTime != null) {
                          final formattedDateTime = DateFormat('dd MMMM yyyy – hh:mm a')
                              .format(_selectedDateTime!);

                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Thank You!'),
                              content: Text(
                                'Your appointment with $_selectedDoctor on $formattedDateTime is confirmed.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a doctor and appointment time.'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade100,
                        foregroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Confirm Appointment'),
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DoctorAppointmentPage(),
  ));
}
