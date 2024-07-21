import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  // final TextEditingController lifeExpectancyController = TextEditingController();
  final TextEditingController adultMortalityController = TextEditingController();
  final TextEditingController infantDeathsController = TextEditingController();
  final TextEditingController alcoholController = TextEditingController();
  final TextEditingController percentageExpenditureController = TextEditingController();
  final TextEditingController hepatitisBController = TextEditingController();
  final TextEditingController measlesController = TextEditingController();
  final TextEditingController bmiController = TextEditingController();
  final TextEditingController underFiveDeathsController = TextEditingController();
  final TextEditingController polioController = TextEditingController();
  final TextEditingController totalExpenditureController = TextEditingController();
  final TextEditingController diphtheriaController = TextEditingController();
  final TextEditingController hivAidsController = TextEditingController();
  final TextEditingController gdpController = TextEditingController();
  final TextEditingController populationController = TextEditingController();
  final TextEditingController thinness1_19YearsController = TextEditingController();
  final TextEditingController thinness5_9YearsController = TextEditingController();
  final TextEditingController incomeCompositionOfResourcesController = TextEditingController();
  final TextEditingController schoolingController = TextEditingController();

  String _predictionResult = "";

  Future<void> _predict() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'Country': countryController.text,
        'Year': int.parse(yearController.text),
        'Status': statusController.text,
        // 'Life_expectancy': double.parse(lifeExpectancyController.text),
        'Adult_Mortality': int.parse(adultMortalityController.text),
        'infant_deaths': int.parse(infantDeathsController.text),
        'Alcohol': double.parse(alcoholController.text),
        'percentage_expenditure': double.parse(percentageExpenditureController.text),
        'Hepatitis_B': int.parse(hepatitisBController.text),
        'Measles': int.parse(measlesController.text),
        'BMI': double.parse(bmiController.text),
        'under_five_deaths': int.parse(underFiveDeathsController.text),
        'Polio': int.parse(polioController.text),
        'Total_expenditure': double.parse(totalExpenditureController.text),
        'Diphtheria': int.parse(diphtheriaController.text),
        'HIV_AIDS': double.parse(hivAidsController.text),
        'GDP': double.parse(gdpController.text),
        'Population': int.parse(populationController.text),
        'thinness_1_19_years': double.parse(thinness1_19YearsController.text),
        'thinness_5_9_years': double.parse(thinness5_9YearsController.text),
        'Income_composition_of_resources': double.parse(incomeCompositionOfResourcesController.text),
        'Schooling': double.parse(schoolingController.text),
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _predictionResult = jsonDecode(response.body)['prediction'].toString();
      });
    } else {
      setState(() {
        _predictionResult = "Error: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Life Expectancy Prediction')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: countryController,
                  decoration: InputDecoration(labelText: 'Country'),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: yearController,
                  decoration: InputDecoration(labelText: 'Year'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: statusController,
                  decoration: InputDecoration(labelText: 'Status'),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                // TextFormField(
                //   // controller: lifeExpectancyController,
                //   decoration: InputDecoration(labelText: 'Life Expectancy'),
                //   keyboardType: TextInputType.number,
                //   validator: (value) => value!.isEmpty ? 'Required' : null,
                // ),
                TextFormField(
                  controller: adultMortalityController,
                  decoration: InputDecoration(labelText: 'Adult Mortality'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: infantDeathsController,
                  decoration: InputDecoration(labelText: 'Infant Deaths'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: alcoholController,
                  decoration: InputDecoration(labelText: 'Alcohol'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: percentageExpenditureController,
                  decoration: InputDecoration(labelText: 'Percentage Expenditure'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: hepatitisBController,
                  decoration: InputDecoration(labelText: 'Hepatitis B'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: measlesController,
                  decoration: InputDecoration(labelText: 'Measles'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: bmiController,
                  decoration: InputDecoration(labelText: 'BMI'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: underFiveDeathsController,
                  decoration: InputDecoration(labelText: 'Under Five Deaths'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: polioController,
                  decoration: InputDecoration(labelText: 'Polio'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: totalExpenditureController,
                  decoration: InputDecoration(labelText: 'Total Expenditure'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: diphtheriaController,
                  decoration: InputDecoration(labelText: 'Diphtheria'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: hivAidsController,
                  decoration: InputDecoration(labelText: 'HIV AIDS'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: gdpController,
                  decoration: InputDecoration(labelText: 'GDP'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: populationController,
                  decoration: InputDecoration(labelText: 'Population'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: thinness1_19YearsController,
                  decoration: InputDecoration(labelText: 'Thinness 1-19 Years'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: thinness5_9YearsController,
                  decoration: InputDecoration(labelText: 'Thinness 5-9 Years'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: incomeCompositionOfResourcesController,
                  decoration: InputDecoration(labelText: 'Income Composition of Resources'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                TextFormField(
                  controller: schoolingController,
                  decoration: InputDecoration(labelText: 'Schooling'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _predict();
                    }
                  },
                  child: Text('Predict'),
                ),
                SizedBox(height: 20),
                Text(
                  _predictionResult.isEmpty ? '' : 'Predicted Life Expectancy: $_predictionResult',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
