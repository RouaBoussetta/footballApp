import 'package:flutter/material.dart';
import 'package:footballapp/services/api.dart';
 
import 'model/footballmatch.dart';
import 'views/widgets/body.dart';

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
 
      routes: {
        "home":(context) => const Home(),
       },
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return 
Scaffold(

  appBar: AppBar(
    backgroundColor: Colors.white10,
         elevation: 0.0,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,

  ),
  
  
  body:     FutureBuilder(
          future: Api(). getAllMatches(),
          builder: (context,AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
           
              return pageBody(snapshot.data as List<FootballMatch>);
            } else {
              return const Center(
                child:   CircularProgressIndicator(),
              );
            }
          },
      
    ));

    
  }
}