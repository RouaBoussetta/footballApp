import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:footballapp/model/footballmatch.dart';
import 'package:footballapp/views/body.dart';
import 'package:footballapp/views/match.dart';
import 'package:footballapp/views/matchTile.dart';
import 'package:http/http.dart' as http;

import 'services/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "home":(context) => const Home(),
        "MatchDetails":(context) => const MatchDetails()
      },
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
       length: 2,
      child: Scaffold(
          backgroundColor: Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Color(0xFFFAFAFA),
            elevation: 0.0,
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
             bottom: const TabBar(
              labelColor: Colors.black,
                tabs: [
                  Tab(icon: Icon(Icons.directions_car),child: Text("Home")),
                  Tab(icon: Icon(Icons.directions_transit)),
                 ],
              ),
          ),
          body: 
          FutureBuilder(
          future: Api().getAllMatches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
           
              return pageBody(snapshot.data as List<FootballMatch>);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
          
          /*
          Container(
            height:100,
            decoration: BoxDecoration(
            color: Colors.blue,
        ),
              margin: EdgeInsets.symmetric(vertical: 2.0), child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
                children:  [

 
 Column(
   children: [

      const  Text(
                  "Local Team",
                 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
             
        Image.network(
            "https://upload.wikimedia.org/wikipedia/sco/thumb/4/47/FC_Barcelona_%28crest%29.svg/2020px-FC_Barcelona_%28crest%29.svg.png",
           
            width: 36.0,
          ),
       const Expanded(
        
                child: Text(
                  "home",
                 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
   ],
 ),
         const Expanded(
            child: Text("0-1",
             // "$homeGoal - $awayGoal",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),    

          Column(
   children: [

       const   Text(
                  "Vistor Team",
                 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              
        Image.network(
            "https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png",
           
            width: 36.0,
          ),
       const Expanded(
        
                child: Text(
                  "Away",
                 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
   ],
 ), 

  ElevatedButton(onPressed: () async {
                            var data = {'title': 'My first post'};
                            print("ttt");
  var resp = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
   );
   print("rrrrr");
  print(resp.body);
                        }, child: Text("data"))       
                ],
              ),

              
              
              
              ),
*/

              
 
          ),
    );
  }
}
