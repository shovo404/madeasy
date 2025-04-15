import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  final List<Map<String, dynamic>> plans = [
    {
      'title': 'Basic Plan',
      'price': '৳299/month',
      'features': ['1 doctor consult', 'Email support', 'Symptom checker access'],
    },
    {
      'title': 'Premium Plan',
      'price': '৳699/month',
      'features': ['5 doctor consults', 'Priority support', 'All app features'],
    },
    {
      'title': 'Family Plan',
      'price': '৳1299/month',
      'features': ['Unlimited consults for 4 members', '24/7 support', 'Video consultations'],
    },
  ];

  SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Subscription Plans')),
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                'https://i.postimg.cc/XJ4CwfVR/austin-distel-f-Eedoyps-W-U-unsplash.jpg',
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),  // Darken the image for contrast
                colorBlendMode: BlendMode.darken,
              ),
            ),
            // Subscription Content
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: plans.length,
              itemBuilder: (context, index) {
                final plan = plans[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan['title'] as String,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          plan['price'] as String,
                          style: const TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        const SizedBox(height: 10),
                        ...(plan['features'] as List<dynamic>).map((f) => Row(
                          children: [
                            const Icon(Icons.check, color: Colors.green),
                            const SizedBox(width: 5),
                            Text(f as String),
                          ],
                        )),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Subscribed to ${plan['title']}')),
                            );
                          },
                          child: const Text('Subscribe'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(SubscriptionPage());
}