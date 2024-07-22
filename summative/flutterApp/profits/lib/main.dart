import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profit Prediction'),
        ),
        body: ProfitPredictionForm(),
      ),
    );
  }
}

class ProfitPredictionForm extends StatefulWidget {
  @override
  _ProfitPredictionFormState createState() => _ProfitPredictionFormState();
}

class _ProfitPredictionFormState extends State<ProfitPredictionForm> {
  final _formKey = GlobalKey<FormState>();
  double rndSpend = 0;
  double administration = 0;
  double marketingSpend = 0;
  String state = '';

Future<void> _predictProfit() async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/predict'), // Ensure this is correct
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'rnd_spend': rndSpend,
        'administration': administration,
        'marketing_spend': marketingSpend,
        'state': state,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print('Predicted Profit: ${result['profit']}');
      // Show result in a dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Predicted Profit: ${result['profit']}'),
          );
        },
      );
    } else {
      throw Exception('Failed to predict profit');
    }
  } catch (e) {
    print('Error: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'R&D Spend'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                rndSpend = double.parse(value);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Administration'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                administration = double.parse(value);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Marketing Spend'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                marketingSpend = double.parse(value);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'State'),
              onChanged: (value) {
                state = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictProfit,
              child: Text('Predict Profit'),
            ),
          ],
        ),
      ),
    );
  }
}
