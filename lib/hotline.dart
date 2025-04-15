import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher for calling functionality

class MadeasyHotlineScreen extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {'name': 'Support', 'number': '09612345678'},
    {'name': 'Doctor', 'number': '01711223344'},
    {'name': 'Emergency', 'number': '01880000000'},
    {'name': 'Lab', 'number': '01555555555'},
    {'name': 'Appointment', 'number': '01300001111'},
  ];

  MadeasyHotlineScreen({super.key});

  // Function to call the number
  Future<void> _callNumber(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);  // Open dialer with the number
    } else {
      throw 'Could not launch $url';  // Error handling if the call cannot be initiated
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Madeasy Hotline'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Updated Background Image
          Positioned.fill(
            child: Image.network(
              'https://i.postimg.cc/D0MVrcK5/alexander-andrews-JYGn-B9g-TCls-unsplash.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5), // Dark overlay for contrast
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Hotline List
          ListView.builder(
            itemCount: hotlines.length,
            itemBuilder: (context, index) {
              final hotline = hotlines[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                color: Colors.white.withOpacity(0.85),
                child: ListTile(
                  leading: const Icon(Icons.support_agent, color: Colors.teal),
                  title: Text(hotline['name']!),
                  subtitle: Text(hotline['number']!),
                  trailing: const Icon(Icons.call, color: Colors.teal),
                  onTap: () => _callNumber(hotline['number']!),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
