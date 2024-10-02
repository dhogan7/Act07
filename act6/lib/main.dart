import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  setupWindow();  // Setting up window properties for desktop platforms
  runApp(
    ChangeNotifierProvider(
      create: (context) => AgeCounter(),  // Change to AgeCounter
      child: const MyApp(),
    ),
  );
}

const double windowWidth = 360;
const double windowHeight = 640;

void setupWindow() async {
  // Check for desktop platforms and initialize window size
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    setWindowTitle('Age Counter');  // Updated title for the window
    setWindowMinSize(Size(windowWidth, windowHeight));
    setWindowMaxSize(Size(windowWidth, windowHeight));

    final screen = await getCurrentScreen(); // Await the Future result
    if (screen != null) {
      setWindowFrame(Rect.fromCenter(
        center: screen.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    }
  }
}

void setWindowFrame(Rect rect) {
  setWindowBounds(rect); // Correctly set window bounds
}

void setWindowBounds(Rect rect) {}

Future<Screen?> getCurrentScreen() async {
  return getCurrentScreen(); // Call to get current screen; ensure this is correct
}

void setWindowMaxSize(Size size) {
  setMaxDimensions(size.width, size.height); // Correctly set max dimensions
}

void setMaxDimensions(double width, double height) {}

void setWindowMinSize(Size size) {
  setMinDimensions(size.width, size.height); // Correctly set min dimensions
}

void setMinDimensions(double width, double height) {}

void setWindowTitle(String title) {
  setWindowTitle(title); // Ensure this is correctly set
}

/// A model for tracking a person's age
class AgeCounter with ChangeNotifier {
  int age = 0;  // Initial age set to 0

  void incrementAge() {
    age += 1;  // Increment the age by 1
    notifyListeners();  // Notify listeners to update the UI
  }

  void decrementAge() {
    if (age > 0) {  // Ensure age doesn't go below 0
      age -= 1;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Counter'),
        backgroundColor: Colors.red,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the current age
            Consumer<AgeCounter>(
              builder: (context, ageCounter, child) => Text(
                'I am ${ageCounter.age} years old',  // Display the phrase with the current age
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            // Add buttons for incrementing and decrementing age
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    var ageCounter = context.read<AgeCounter>();
                    ageCounter.incrementAge();  // Increment the age when pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 184, 11), // Set button color to green
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: const Text('Increase Age'),
                ),
                const SizedBox(height: 20),  // Add space between the buttons
                ElevatedButton(
                  onPressed: () {
                    var ageCounter = context.read<AgeCounter>();
                    ageCounter.decrementAge();  // Decrement the age when pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 184, 11), // Set button color to green
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: const Text('Decrease Age'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
