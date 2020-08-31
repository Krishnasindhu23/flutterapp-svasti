import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Future<List<User>> _getUsers() async {
    print("get users: called");
    List<User> users = [];
    var data =
        await DefaultAssetBundle.of(context).loadString("assets/users.json");

    // perfectly working..
    var jsonData = json.decode(data);
    for (var u in jsonData) {
      User user = User(int.parse(u['index']), u['name'], u['content'],
          u['picture']); // change2
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asanas",style: TextStyle(fontFamily:'Quando',fontSize: 20.0,color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Text("Loading...Please wait"),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index].picture),
                          ),
                          title: Text(
                            snapshot.data[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                                fontFamily: 'Quando',
                                fontSize: 20.0),
                          ),
                          onTap: (){
                              Navigator.push(
                                     context,
                        MaterialPageRoute(
                              builder: (context) =>DetailPage(snapshot.data[index]))
    );
                              },
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}

// now okay :)

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name,style:TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Quando',
            fontSize: 20.0)),
        backgroundColor: Colors.pink,
      ),
      body:
          SafeArea(
            left: true,
            top: true,
            right: true,
            bottom: true,
            child: Container(
              margin: EdgeInsets.all(9.0),
              child: ListView(
                
                 children: <Widget>[
                    Image.network(user.picture),
                    SizedBox(height: 5.0,),
                    Text(user.content,style:TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                        fontFamily: 'Raleway',
                        fontSize: 17.0)
                    ),
                  ]
              ),
            ),
          )
    );

  }
}


class User {
  final String name;
  final int index;
  final String content;
  final String picture;

  User(this.index, this.name, this.content, this.picture);
}
