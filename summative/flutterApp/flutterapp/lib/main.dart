import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.teal),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
          headlineMedium: TextStyle(fontSize: 16, color: Colors.black87),
          headlineLarge: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Button color
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: TeacherForm(),
    );
  }
}

class TeacherForm extends StatefulWidget {
  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final _formKey = GlobalKey<FormState>();
  String _degree = '';
  String _domain = '';
  String _experience = '';
  String _age = '';
  String _yearsExperience = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Information Form'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade100, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please fill in your details:',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 20),
                _buildTextField('Degree', 'Please enter your degree', (value) {
                  _degree = value ?? '';
                }),
                _buildTextField('Domain of Education', 'Please enter your domain of education', (value) {
                  _domain = value ?? '';
                }),
                _buildTextField('Years of Experience', 'Please enter your years of experience', (value) {
                  _yearsExperience = value ?? '';
                }),
                _buildTextField('Age', 'Please enter your age', (value) {
                  _age = value ?? '';
                }),
                _buildTextField('Experience', 'Please enter your experience', (value) {
                  _experience = value ?? '';
                }),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                      print('Degree: $_degree');
                      print('Domain: $_domain');
                      print('Years of Experience: $_yearsExperience');
                      print('Age: $_age');
                      print('Experience: $_experience');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String validatorText, void Function(String?) onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
