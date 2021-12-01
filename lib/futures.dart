import'package:flutter/material.dart';
void main(){
  final Future<int> myFuture=Future.delayed(Duration(seconds:5),()=>info(9));

  myFuture.then((value) => print(value)).catchError((err)=>print(err));
  print('1');

  runApp(MyApp());
}

int info(int a){
  return a;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Futures',
      home:MyHomePage(),
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
    return FutureBuilder(
        future: Future.delayed(Duration(seconds:5),()=>info(9)),
        builder:(context,snapShoot){
          return Scaffold(
            appBar:AppBar(
              title:Text(snapShoot.hasData?'${snapShoot.data}':'Futures'),
            ),
            body:Center(
              child:snapShoot.connectionState==ConnectionState.waiting?CircularProgressIndicator():Text('Don!'),
            ),
          );
        }
    );
  }
}
