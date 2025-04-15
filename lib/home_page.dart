import 'package:flutter/material.dart';
import 'login_page.dart';
import 'doctor_list.dart';
import 'hotline.dart';
import 'appointment.dart';
import 'subscription.dart';
import 'symptom.dart';
import 'sample.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> options = [
    {'label': 'Doctor Appointment', 'icon': Icons.access_time, 'page': DoctorAppointmentPage()},
    {'label': 'Doctor Details', 'icon': Icons.memory, 'page': AIDoctorMatchingPage()},
    {'label': 'Sample Collection', 'icon': Icons.collections, 'page': SampleCollectionPage()},
    {'label': 'Symptom Checker', 'icon': Icons.healing, 'page': SymptomCheckerPage()},
    {'label': 'Subscription', 'icon': Icons.subscriptions, 'page': SubscriptionPage()},
    {'label': 'Hotline', 'icon': Icons.phone, 'page': MadeasyHotlineScreen()},
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Make appBar overlay the image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://i.postimg.cc/j5xhs0Jn/etactics-inc-g3-Ps-F4-y7-ZY-unsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Foreground Content with opacity
          Container(
            color: Colors.black.withOpacity(0.4), // Optional dimming effect
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Doctor',
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (options[index]['page'] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => options[index]['page'] as Widget),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${options[index]['label']} is not available yet.'),
                                ),
                              );
                            }
                          },
                          child: Card(
                            color: Colors.teal.withOpacity(0.85),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(options[index]['icon'], size: 40, color: Colors.white),
                                const SizedBox(height: 10),
                                Text(
                                  options[index]['label'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
