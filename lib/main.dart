import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de temperatura',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          accentColor: const Color(0xFF2196f3),
          canvasColor: const Color(0xFFfafafa)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de temperatura'),
        centerTitle: true,
      ),
      body: Conversor(),
    );
  }
}

class Conversor extends StatefulWidget {
  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  TextEditingController _ctrlCelsius = TextEditingController();
  TextEditingController _ctrlFahrenheit = TextEditingController();

  var msgResultF = "";
  var msgResultC = "";

  void calcularF() {
    double _celsius = double.tryParse(_ctrlCelsius.text);
    if (_celsius == null) {
      setState(() {
        msgResultF = "Digite a temperatura em Celsius";
      });
    } else {
      var fahrenheit = ((9 / 5) * _celsius + 32).toStringAsFixed(1);
      setState(() {
        msgResultF = "$fahrenheit ºF";
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        //import 'package:flutter/services.dart;
      });
    }
  }

  void limparF() {
    setState(() {
      _ctrlCelsius.text = "";
      msgResultF = "";
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
  }

  void calcularC() {
    double _fahrenheit = double.tryParse(_ctrlFahrenheit.text);
    if (_fahrenheit == null) {
      setState(() {
        msgResultC = "Digite a temperatura em Fahrenheit";
      });
    } else {
      var celsius = ((_fahrenheit - 32) * 5 / 9).toStringAsFixed(1);
      setState(() {
        msgResultC = "$celsius ºC";
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      });
    }
  }

  void limparC() {
    setState(() {
      _ctrlFahrenheit.text = "";
      msgResultC = "";
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Celsius p/ Fahrenheit",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: _ctrlCelsius,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Graus Celsius"),
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Roboto'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calcularF();
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      limparF();
                    },
                    child: Text(
                      'Limpar',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ],
              ),
              Text(
                msgResultF,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Fahrenheit p/ Celsius",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: _ctrlFahrenheit,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Graus Fahrenheit"),
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Roboto'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        calcularC();
                      },
                      child: Text(
                        'Calcular',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        limparC();
                      },
                      child: Text(
                        'Limpar',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto'),
                      ),
                    )
                  ],
                ),
                Text(
                  msgResultC,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                )
              ])
        ],
      ),
    );
  }
}
