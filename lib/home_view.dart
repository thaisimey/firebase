import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/model/animal.dart';
import 'package:flutter_firebase_app/model/people.dart';
import 'package:flutter_firebase_app/model/popular.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  DatabaseReference _counterRef;
  DatabaseReference _movie;
  DataSnapshot snapshot;
  List<Popular> list = [];

  @override
  void initState() {
    super.initState();
    _counterRef = FirebaseDatabase.instance.reference().child('user');
    _movie = FirebaseDatabase.instance.reference().child('list_movie');
    _counterRef.onChildAdded.listen((event) {
      print('on child added ${event.snapshot.key}');
      print('on child added ${event.snapshot.value}');
    });
    _counterRef.onChildChanged.listen((event) {
      print('on onChildChanged ${event.snapshot.key}');
      print('on onChildChanged ${event.snapshot.value}');
    });
    _counterRef.onChildMoved.listen((event) {
      print('on onChildMoved ${event.snapshot.key}');
      print('on onChildMoved ${event.snapshot.value}');
    });
    _counterRef.onChildRemoved.listen((event) {
      print('on onChildRemoved ${event.snapshot.key}');
      print('on onChildRemoved ${event.snapshot.value}');
    });

    _movie.child('3').once().then((DataSnapshot snapshot) {
      debugPrint('Data : ${snapshot.key}');
      debugPrint('Data : ${snapshot.value}');
    });




  }

  Future<int> getData() => Future.delayed(Duration(milliseconds: 1000), () {
    return Future.value(100);
  });

  int keyIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              initialData: 10,
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error getting data.");
                }
                if (snapshot.data != null && snapshot.hasData) {
                  return Text("Value is ${snapshot.data}");
                }

                return CircularProgressIndicator();
              },
            ),
            // RaisedButton(onPressed: () async{
            //   Animal animal = Animal(id:"1",name: "Lion",gender: "male");
            //   await _chat.push().set(animal.toJson());
            // },
            // child: Text("save"),),

            RaisedButton(onPressed: () async{
              setState(() {
                keyIndex++;
              });
              await _movie.child(keyIndex.toString()).set({
                  "adult": false,
                  "backdrop_path": "/lM9f4CnWU4RIY8HiVrwmrNKJpYN.jpg",
                  "genre_ids": [
                    35
                  ],
                  "id": 650747,
                  "original_language": "es",
                  "original_title": "Historias lamentables",
                  "overview": "Four interconnected plots starring Ramón, a young heir; Bermejo, a tourist obsessed with order; Ayoub, an African immigrant pursuing his dream; and Alipio, a businessman addicted with gambling.",
                  "popularity": 1740.929,
                  "poster_path": "/sp4zXS3x4wHyL8wm8zLioiBrxuR.jpg",
                  "release_date": "2020-11-19",
                  "title": "Unfortunate Stories",
                  "video": false,
                  "vote_average": 7,
                  "vote_count": 40

              });
            },
              child: Text("save"),),
            RaisedButton(onPressed: () {
              _movie.once().then((DataSnapshot snapshot) {
                print('Data : ${snapshot.value}');
              });
            },
              child: Text("get Data"),
            ),


          ],
        ),
      ),
    );
  }
}
