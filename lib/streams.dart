import 'dart:async';

import 'package:flutter/material.dart';

void main() {

  final myStreams = Stream.periodic(Duration(seconds: 1), (a) => a).asBroadcastStream();
  final myStreams2= myStreams.where((event) => event%2==0);
  final sub = myStreams2.listen((event) {
    print(event);
  });
  sub.onData((data) {
    data>10?sub.cancel():print(data);
  });


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Streams',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Streams'),),

      body: StreamBuilder(
        stream:
        Stream.periodic(Duration(seconds: 5), (a) => a).where((event) => event%2==0),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {
        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:snapshot.connectionState==ConnectionState.waiting?CircularProgressIndicator():Text("Done!"),
                ),
                Text(
                    (snapshot.hasData&&snapshot.data<10)?'${snapshot.data}':'gggggggg',style:TextStyle(fontSize:45,color:Colors.grey),),
              ],
            ));
       },

      ),
    );
  }
}
