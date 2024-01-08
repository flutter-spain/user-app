import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  Map data = {};
  List userData = [];
  
  
  getUsers() async {
   http.Response response = await http.get(Uri.parse('http://localhost:4000/api/user'));
   data = jsonDecode(response.body);
   setState(() {
     userData = data['users'];
   });

   //debugPrint(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(userData[index]['avatar']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${userData[index]['firstName']}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    )
                  ],
                ),
              ),
            );
          }


      ),
    );
  }
}

