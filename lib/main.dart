import 'package:flutter/material.dart';
import 'home_page.dart'; 
import 'login_page.dart'; 
import 'doctor_list.dart'; 
import 'hotline.dart'; 
import 'appointment.dart';
import 'subscription.dart';
import 'symptom.dart';
import 'sample.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Madeasy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(), 
    );
  }
}
