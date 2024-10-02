import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter and Image Toggle App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isFirstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter and Image Toggle App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Increment'),
            ),
            SizedBox(height: 50),
            _isFirstImage
                ? Image.asset('assets/Monkey_D_Luffy.png',
                    width: 300, // Adjust the width here
                    height: 300, // Adjust the height here
                )
                : Image.asset(
                    'assets/Roronoa_Zoro_Post_Timeskip.webp',
                    width: 300, // Adjust the width here
                    height: 300, // Adjust the height here
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleImage,
              child: Text('Toggle Image'),
            ),
          ],
        ),
      ),
    );
  }
}

