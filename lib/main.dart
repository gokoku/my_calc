import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCalc(),
    );
  }
}

class MyCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MyCalc')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("a"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    myPanel("7"),
                    myPanel("4"),
                    myPanel("1"),
                    myPanel("0")
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    myPanel("8"),
                    myPanel("5"),
                    myPanel("2"),
                    myPanel("00")
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    myPanel("9"),
                    myPanel("6"),
                    myPanel("3"),
                    myPanel("=")
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    myPanel("-"),
                    myPanel("+"),
                    myPanel("*"),
                    myPanel("/")
                  ],
                ),
              ],
            )
          ],
        ));
  }

  Container myPanel(String n) {
    return Container(
      margin: const EdgeInsets.all(1),
      width: 70,
      height: 70,
      color: Colors.black26,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              n,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ]),
    );
  }
}
