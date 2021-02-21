import 'package:flutter/material.dart';
import 'dart:async';
import 'calculation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calc',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Calculator"),
        ),
        body: Column(
          children: [
            TextField(),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}

class TextField extends StatefulWidget {
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  static final controller = StreamController<String>.broadcast();
  String _expression = '0';
  String _regist = '';
  String _operation = '';

  void initState() {
    controller.stream.listen((event) => _UpdateText(event));
  }

  void _UpdateText(String letter) {
    List res = Calculator.receive(letter);
    setState(() {
      _expression = res[0];
      _regist = res[1];
      _operation = res[2];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Text(
                _operation,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30.0,
                ),
              ),
              Text(
                _regist,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 30.0,
                ),
              )
            ],
          ),
          Spacer(),
          Text(
            _expression,
            style: TextStyle(fontSize: 64.0),
          ),
        ],
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        //color: const Color(0xff87fefa),
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          children: [
            '7',
            '8',
            '9',
            '/',
            '4',
            '5',
            '6',
            '*',
            '1',
            '2',
            '3',
            '-',
            'C',
            '0',
            '=',
            '+',
          ].map((key) {
            return GridTile(
              child: Button(key),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final _key;
  Button(this._key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffeee0b0),
          onPrimary: Colors.black54,
          shape: const StadiumBorder(),
          elevation: 8,
        ),
        onPressed: () {
          _TextFieldState.controller.sink.add(_key);
        },
        child: Center(
          child: Text(
            _key,
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
    );
  }
}
