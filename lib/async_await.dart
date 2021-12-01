import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Async Await',
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
  getDate()
  {
    Stream<int> myStream= Stream.periodic(Duration(microseconds:500),(a)=>a);
    return myStream;

   /* await for(final value in myStream){
      if(value>10) break;
      print(value);
    }

    */
    //myStream.listen((event) {print(event);});
  }

  // getDate() async{
  //   try{
  //     int a= await Future.delayed(Duration(seconds:1),()=>throw Exception("Invalid"));
  //     print(a);
  //   }catch(e){
  //     print("Error=$e");
  //   }

    //final myFuture=Future.delayed(Duration(seconds:1),()=>1);
   // myFuture.then((value) => print(value));
 // }
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Async Await+$i'),),
      body:Center(
        child:RaisedButton(
          child:Text('Click Me'),
          onPressed:()async{
            await for(final item in getDate()){
              setState(() {
                i =(item<100?item:0);
              });
            }
          },
        ),
      ),
    );
  }
}
