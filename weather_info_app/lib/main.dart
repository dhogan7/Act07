import 'package:flutter/material.dart';
import 'dart:math';  // For random number generation

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomeScreen(),
    );
  }
}

class WeatherHomeScreen extends StatefulWidget {
  @override
  _WeatherHomeScreenState createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';
  List<Map<String, String>> sevenDayForecast = [];

  // Function to generate random temperature and weather condition
  String getRandomTemperature() {
    return (15 + Random().nextInt(16)).toString() + '°C'; // Random temperature between 15°C and 30°C
  }

  String getRandomWeatherCondition() {
    final conditions = ['Sunny', 'Cloudy', 'Rainy'];
    return conditions[Random().nextInt(3)];
  }

  // Simulate fetching current weather
  void fetchWeather() {
    setState(() {
      temperature = getRandomTemperature();
      weatherCondition = getRandomWeatherCondition();
    });
  }

  // Simulate fetching 7-day forecast
  void fetchSevenDayForecast() {
    setState(() {
      sevenDayForecast = List.generate(7, (index) {
        return {
          'day': 'Day ${index + 1}',
          'temperature': getRandomTemperature(),
          'condition': getRandomWeatherCondition(),
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField for user input
            TextField(
              decoration: InputDecoration(labelText: 'Enter City Name'),
              onChanged: (value) {
                cityName = value;
              },
            ),
            SizedBox(height: 10),
            
            // Button to fetch current weather
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            
            // Button to fetch 7-day forecast
            ElevatedButton(
              onPressed: fetchSevenDayForecast,
              child: Text('Fetch 7-Day Forecast'),
            ),

            SizedBox(height: 20),
            
            // Display current weather
            Text('City: $cityName', style: TextStyle(fontSize: 18)),
            Text('Temperature: $temperature', style: TextStyle(fontSize: 18)),
            Text('Weather Condition: $weatherCondition', style: TextStyle(fontSize: 18)),

            SizedBox(height: 20),
            
            // Display 7-day forecast
            if (sevenDayForecast.isNotEmpty) 
              Text('7-Day Forecast:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            for (var dayForecast in sevenDayForecast)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dayForecast['day']!, style: TextStyle(fontSize: 16)),
                    Text('Temp: ${dayForecast['temperature']}', style: TextStyle(fontSize: 16)),
                    Text(dayForecast['condition']!, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}