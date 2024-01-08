import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.light(
          secondary: Colors.lightGreenAccent,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _billAmount = 0.0;
  int _numberOfPeople = 1;
  int _tipPercentage = 20;

  @override
  Widget build(BuildContext context) {
    double tipAmount = _billAmount * (_tipPercentage / 100);
    double totalAmount = _billAmount + tipAmount;
    double amountPerPerson = totalAmount / _numberOfPeople;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator napiwku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Tyle płaci każda osoba:',
                    style: TextStyle(fontSize: 17, color: Colors.blueAccent),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${amountPerPerson.toStringAsFixed(2)} zł',
                    style: TextStyle(fontSize: 30, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Do zapłaty: ',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _billAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 15),
            Slider(
              min: 0,
              max: 100,
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.cyanAccent,
              divisions: 10,
              value: _tipPercentage.toDouble(),
              onChanged: (double value) {
                setState(() {
                  _tipPercentage = value.round();
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              '$_tipPercentage%',
              style: TextStyle(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  'Ilość osób  ',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        _numberOfPeople =
                        (_numberOfPeople > 1) ? _numberOfPeople - 1 : 1;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$_numberOfPeople',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        _numberOfPeople = _numberOfPeople + 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Kwota napiwku ${tipAmount.toStringAsFixed(2)} zł',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Całkowita kwota ${totalAmount.toStringAsFixed(2)} zł',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
