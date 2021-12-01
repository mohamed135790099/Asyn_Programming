import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'API',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future fetchPhotos()async{
   var res =    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
   if(res.statusCode==200){
     var obj=jsonDecode(res.body);
     return obj;
   }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('API'),),
      body:Center(
        child:FutureBuilder(
          future:fetchPhotos(),
          builder:(context,snapShoot){
            if(snapShoot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else{
              return ListView.builder(
                itemBuilder:(context,index)
                {
                  return ListTile(
                    leading:CircleAvatar(backgroundImage:NetworkImage(snapShoot.data[index]['thumbnailUrl']),),
                    title:Text(snapShoot.data[index]['title']),
                    subtitle:Text("${snapShoot.data[index]['id']}"),
                  );
                },
                itemCount:30 ,
              );
            }
          },
        )
      ),
    );
  }
}
