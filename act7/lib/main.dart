import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAndImageAnimation(),
    );
  }
}

class FadingTextAndImageAnimation extends StatefulWidget {
  @override
  _FadingTextAndImageAnimationState createState() =>
      _FadingTextAndImageAnimationState();
}

class _FadingTextAndImageAnimationState
    extends State<FadingTextAndImageAnimation> {
  bool _isTextVisible = true;
  bool _isImageVisible = false;

  void toggleVisibility() {
    setState(() {
      if (_isTextVisible) {
        _isTextVisible = false;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _isImageVisible = true;
          });
        });
      } else {
        _isImageVisible = false;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _isTextVisible = true;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fading background image
          AnimatedOpacity(
            opacity: _isImageVisible ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Positioned.fill(
              child: Image.network(
                'data:image/jpeg;base64,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', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Fading text
          Center(
            child: AnimatedOpacity(
              opacity: _isTextVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: const Text(
                'Welcome, Flutter!',
                style: TextStyle(
                  fontSize: 48,
                  color: Color.fromARGB(255, 169, 8, 8),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Disappearing Act'),
        backgroundColor: Colors.orange,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
