import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayText = '0'; // Display area text
  String _operator = ''; // To store the operator (+, -, *, /)
  double _firstOperand = 0; // First number input
  double _secondOperand = 0; // Second number input
  bool _isSecondOperand = false; // Check if we are entering the second number

  void _clearDisplay() {
    setState(() {
      _displayText = '0';
      _firstOperand = 0;
      _secondOperand = 0;
      _operator = '';
      _isSecondOperand = false;
    });
  }

  void _inputNumber(String number) {
    setState(() {
      if (_isSecondOperand) {
        if (_displayText == '0') {
          _displayText = number;
        } else {
          _displayText += number;
        }
        _secondOperand = double.parse(_displayText);
      } else {
        if (_displayText == '0') {
          _displayText = number;
        } else {
          _displayText += number;
        }
        _firstOperand = double.parse(_displayText);
      }
    });
  }

  void _inputOperator(String operator) {
    setState(() {
      if (_displayText.isNotEmpty && !_isSecondOperand) {
        _isSecondOperand = true;
        _displayText = '0';
        _operator = operator;
      }
    });
  }

  void _inputDecimal() {
    setState(() {
      if (!_displayText.contains('.')) {
        _displayText += '.';
      }
    });
  }

  void _calculateResult() {
    setState(() {
      double result = 0;
      if (_operator.isNotEmpty) {
        switch (_operator) {
          case '+':
            result = _firstOperand + _secondOperand;
            break;
          case '-':
            result = _firstOperand - _secondOperand;
            break;
          case '*':
            result = _firstOperand * _secondOperand;
            break;
          case '/':
            result = _secondOperand == 0 ? double.nan : _firstOperand / _secondOperand;
            break;
        }
        _displayText = result.toStringAsFixed(2);
        _firstOperand = result;
        _isSecondOperand = false;
      }
    });
  }

  Widget _buildButton(String label, {Color color = Colors.black, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Display area
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Text(
              _displayText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          // Calculator buttons
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton('7', onTap: () => _inputNumber('7')),
                  _buildButton('8', onTap: () => _inputNumber('8')),
                  _buildButton('9', onTap: () => _inputNumber('9')),
                  _buildButton('/', color: const Color.fromARGB(255, 214, 136, 3), onTap: () => _inputOperator('/')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton('4', onTap: () => _inputNumber('4')),
                  _buildButton('5', onTap: () => _inputNumber('5')),
                  _buildButton('6', onTap: () => _inputNumber('6')),
                  _buildButton('*', color: const Color.fromARGB(255, 214, 136, 3), onTap: () => _inputOperator('*')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton('1', onTap: () => _inputNumber('1')),
                  _buildButton('2', onTap: () => _inputNumber('2')),
                  _buildButton('3', onTap: () => _inputNumber('3')),
                  _buildButton('-', color: const Color.fromARGB(255, 214, 136, 3), onTap: () => _inputOperator('-')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton('0', onTap: () => _inputNumber('0')),
                  _buildButton('.', onTap: _inputDecimal),
                  _buildButton('C', color: Colors.black, onTap: _clearDisplay),
                  _buildButton('+', color: const Color.fromARGB(255, 214, 136, 3), onTap: () => _inputOperator('+')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton('=', color: const Color.fromARGB(255, 214, 136, 3), onTap: _calculateResult),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
