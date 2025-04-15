import 'package:flutter/material.dart';

class AIDoctorMatchingPage extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {'name': 'Dr. Shahriar', 'specialization': 'AI Diagnostics Specialist', 'experience': '10 years', 'hospital': 'FutureCare Hospital'},
    {'name': 'Dr. Ahmed', 'specialization': 'Neural Network Analyst', 'experience': '8 years', 'hospital': 'SmartHealth Institute'},
    {'name': 'Dr. Shovo', 'specialization': 'Predictive Health Expert', 'experience': '12 years', 'hospital': 'NextGen Clinic'},
    {'name': 'Dr. Siam', 'specialization': 'AI Diagnostics Specialist', 'experience': '10 years', 'hospital': 'FutureCare Hospital'},
    {'name': 'Dr. Mim', 'specialization': 'Neural Network Analyst', 'experience': '8 years', 'hospital': 'SmartHealth Institute'},
    {'name': 'Dr. Abir', 'specialization': 'Predictive Health Expert', 'experience': '12 years', 'hospital': 'NextGen Clinic'},
    {'name': 'Dr. Rabbi', 'specialization': 'AI Diagnostics Specialist', 'experience': '10 years', 'hospital': 'FutureCare Hospital'},
    {'name': 'Dr. Raj Patel', 'specialization': 'Neural Network Analyst', 'experience': '8 years', 'hospital': 'SmartHealth Institute'},
    {'name': 'Dr. Kajol', 'specialization': 'Predictive Health Expert', 'experience': '12 years', 'hospital': 'NextGen Clinic'},
  ];

  AIDoctorMatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's List"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://i.postimg.cc/02XSR1cB/abdulai-sayni-z-Xpw-ZN7rn-ZY-unsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay and ListView
          Container(
            color: Colors.white.withOpacity(0.85), // Slight white overlay for better readability
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.person, size: 40, color: Colors.teal),
                    title: Text(
                      doctor['name'] ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text('Specialization: ${doctor['specialization']}'),
                        Text('Experience: ${doctor['experience']}'),
                        Text('Hospital: ${doctor['hospital']}'),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
