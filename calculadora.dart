mport 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  double resultado = 0;

  void onPressButton(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '';
        num1 = 0;
        num2 = 0;
        operand = '';
        resultado = 0;
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        num1 = double.parse(display);
        operand = buttonText;
        display = '';
      } else if (buttonText == '=') {
        num2 = double.parse(display);
        switch (operand) {
          case '+':
            resultado = num1 + num2;
            break;
          case '-':
            resultado = num1 - num2;
            break;
          case '*':
            resultado = num1 * num2;
            break;
          case '/':
            resultado = num1 / num2;
            break;
        }
        display = resultado.toString();
        num1 = resultado;
        operand = '';
      } else if (buttonText == '+/-') {
        // Cambiar el signo del número actual en pantalla
        if (display != '' && display != '0') {
          display = (double.parse(display) * -1).toString();
        }
      } else if (buttonText == '%') {
        // Calcular el porcentaje del número actual en pantalla
        if (display != '' && display != '0') {
          double porcentaje = double.parse(display) / 100;
          display = porcentaje.toString();
        }

      } else {
        display += buttonText;
      }
    });
  }


  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressButton(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                display,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('0'),
              buildButton('C'),
              buildButton('+/-'),
              buildButton('%'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}
