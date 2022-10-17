import 'package:flutter/material.dart';
import './services/api_helper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String city = '';
  double temp = 0.0;
  int humidity = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search for location',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                city = value;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                var r = await ApiHelper(city).call_api();
                print(r);
                setState(() {
                  temp = r['current']['temp_c'];
                  humidity = r['current']['humidity'];
                });
              },
              child: Text('Weather'),
            ),
            Text('$temp'),
            Text('$humidity'),
          ],
        ),
      ),
    );
  }
}
