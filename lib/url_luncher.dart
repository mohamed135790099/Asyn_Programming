import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'URl Launcher',
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
  String str="Get The App";
  var url="https://www.youtube.com/watch?v=RjZSjVwuSVM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('URL Launcher'),),
      body:Center(
        child:RaisedButton(
          child:Text(str) ,
          onPressed:()async{
            try{
              await canLaunch(url)?await launch(url,forceWebView:true,enableJavaScript:true ):throw'Could Not Launch URl';
            }
            catch(e){
              setState(() {
                str=e.toString();
                print(e.toString());
              });
            }
          },
        ),
      ),
    );
  }
}
