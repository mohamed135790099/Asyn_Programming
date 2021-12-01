import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child:RaisedButton(
          child:Text('Click Me'),
          onPressed:(){
            Isolate.spawn(blockApp,0);
            print('Main Isolate');
          },
        ),
      ),
    );
  }
}
blockApp(int sec){
  print("start");
  sleep(Duration(seconds:sec));
  print("end");
}
