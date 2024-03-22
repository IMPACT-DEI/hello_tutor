// Build an app that generates a random number between 0 and 1000
// when a button is tapped and displays for example: The number 3 is odd.
// The color of the text must change according to the number: red if is odd, green if is even.
// Also change the widget of the FAB between a text and an add icon (text if odd, icon if even)

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odd or Even',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Odd or Even'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  // the state of the widget is composed of the number and the color of the text
  int? _randomNum;
  Color textcolor = Colors.black; // we initialize it as black when we don't have a number yet

  int _createNumber() {
    // generation of random number
    int num = Random().nextInt(1000);
    setState(() {
      _randomNum = num; // set of the new value in the state
/*       if (_randomNum!.isEven) {
        textcolor = Colors.green;
      } else {
        textcolor = Colors.red;
      } */
      textcolor = _randomNum!.isEven ? Colors.green : Colors.red; // tertiary operator which works similarly to the if-else above
    });
    return num; // return the generated number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _randomNum != null // if the number does not exist, we show an informative message to the user
            ? Text(
                'The number is: $_randomNum',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: textcolor,
                ),
              )
            : const Text('Press the FAB to generate a number'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Generate a number');
          int newnum = _createNumber();
          print(newnum);
        },
        tooltip: 'Generate a number',
        child: const Icon(Icons.add),
      ),
    );
  }
}
