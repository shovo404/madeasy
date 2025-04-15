import 'package:flutter/material.dart';

class SymptomCheckerPage extends StatefulWidget {
  const SymptomCheckerPage({super.key});

  @override
  _SymptomCheckerPageState createState() => _SymptomCheckerPageState();
}
class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  final TextEditingController _symptomController = TextEditingController();
  String _result = '';

  void _checkSymptoms() {
    String symptom = _symptomController.text.toLowerCase();
    if (symptom.contains('fever') && symptom.contains('cough')) {
      _result = 'You might have the flu or COVID-19. Consider getting tested.';
    } else if (symptom.contains('fever')) {
      _result = 'Possible viral infection. Monitor your symptoms.';
    } else if (symptom.contains('headache') && symptom.contains('fatigue')) {
      _result = 'Possible causes: Migraine, Stress, or Dehydration. Rest and hydrate.';
    } else if (symptom.contains('headache')) {
      _result = 'Possible causes: Tension headache, eye strain, or sinus infection.';
    } else if (symptom.contains('cough') && symptom.contains('sore throat')) {
      _result = 'Could be a common cold or strep throat. Consider a throat swab.';
    } else if (symptom.contains('cough')) {
      _result = 'Could be a common cold, bronchitis, or allergies.';
    } else if (symptom.contains('abdominal pain') && symptom.contains('diarrhea')) {
      _result = 'Possible food poisoning or gastroenteritis. Stay hydrated.';
    } else if (symptom.contains('abdominal pain')) {
      _result = 'Could be indigestion, gas, or constipation.';
    } else if (symptom.contains('chest pain')) {
      _result = 'Seek immediate medical attention. Could be a heart-related issue.';
    } else if (symptom.contains('shortness of breath')) {
      _result = 'Seek immediate medical attention. Could be asthma or a more serious condition.';
    } else if (symptom.contains('skin rash') && symptom.contains('itching')) {
      _result = 'Possible allergic reaction or eczema. Avoid scratching.';
    } else {
      _result = 'Please consult a doctor for an accurate diagnosis.';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Symptom Checker')),
      body: Stack(
        children: [
          // Full-page background image with 0.3 opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                'https://i.postimg.cc/LX5NtF6K/roman-denisenko-Jf583-PBOs-Qs-unsplash.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _symptomController,
                    decoration: InputDecoration(
                      labelText: 'Enter your symptoms',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _checkSymptoms,
                    child: Text('Check'),
                  ),
                  SizedBox(height: 20),
                  if (_result.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _result,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
