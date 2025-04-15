import 'package:flutter/material.dart';

class SampleCollectionPage extends StatefulWidget {
  const SampleCollectionPage({super.key});

  @override
  SampleCollectionPageState createState() => SampleCollectionPageState();
}

class SampleCollectionPageState extends State<SampleCollectionPage> {
  String? _selectedTest;
  DateTime _selectedDate = DateTime.now();
  String? _selectedSlot;

  final List<String> tests = [
    'Blood Test',
    'Urine Test',
    'COVID-19 PCR',
    'Cholesterol Check',
    'Diabetes Panel',
  ];

  final List<String> timeSlots = [
    '8:00 AM - 9:00 AM',
    '9:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '2:00 PM - 3:00 PM',
    '4:00 PM - 5:00 PM',
  ];

  void _confirmBooking() {
    if (_selectedTest != null && _selectedSlot != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Booking Confirmed!'),
          content: Text('Your $_selectedTest sample will be collected on '
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} '
              'during $_selectedSlot.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a test and time slot.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample Collection")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                'https://i.postimg.cc/BZRtfryh/zlobniyy-j-D2f8c45-RCY-unsplash.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedTest,
                hint: Text('Select a test'),
                items: tests.map((test) {
                  return DropdownMenuItem<String>(
                    value: test,
                    child: Text(test),
                  );
                }).toList(),
                onChanged: (String? val) => setState(() => _selectedTest = val),
                decoration: InputDecoration(
                  labelText: 'Test Type',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2026),
                      );
                      if (picked != null) {
                        setState(() => _selectedDate = picked);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Available Time Slots:', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 10,
                children: timeSlots.map((slot) {
                  return ChoiceChip(
                    label: Text(slot),
                    selected: _selectedSlot == slot,
                    onSelected: (bool selected) =>
                        setState(() => _selectedSlot = slot),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _confirmBooking,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                ),
                child: Text('Book Collection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
