import 'package:flutter/material.dart';
import 'package:footballapp/services/api.dart';
import 'package:footballapp/views/screens/splashscreen.dart';

import 'model/footballmatch.dart';
import 'views/widgets/body.dart';
import 'views/widgets/match.dart';
import 'views/widgets/matchTile.dart';

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
      theme: ThemeData.dark(),
      routes: {
        "home": (context) => const Home(),
      },
      home: const SplashScreen(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
           decoration: BoxDecoration(color: Colors.black54),
          child: Column(

            
            children: [
              FutureBuilder(
                future: Api().getAllLiveMatches(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return header(snapshot.data as List<FootballMatch>);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Matches",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: DefaultTabController(
                            length: 3,
                            initialIndex: 0,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Column(children: <Widget>[
                                  TabBar(
                                    isScrollable: true,
                                    unselectedLabelColor:
                                        Colors.black.withOpacity(0.3),
                                    indicatorColor: Colors.black,
                                    tabs: [
                                      const Tab(
                                        child: Text('Live'),
                                      ),
                                      const Tab(
                                        child: Text('Upcoming'),
                                      ),
                                      Tab(
                                        child: Text('Finished'),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(children: [
                                      FutureBuilder(
                                        future: Api().getAllLiveMatches(),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            return Expanded(
                                              child: ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (ctx) =>
                                                                  MatchDetails(
                                                                      match: snapshot
                                                                              .data[
                                                                          index]))),
                                                      child: matchTile(context,
                                                          snapshot.data[index]));
                                                },
                                              ),
                                            );
                                          } else {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),
                                      FutureBuilder(
                                        future: Api().getAllupcommingMatches(),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            return Expanded(
                                              child: ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (ctx) =>
                                                                  MatchDetails(
                                                                      match: snapshot
                                                                              .data[
                                                                          index]))),
                                                      child: matchTile(context,
                                                          snapshot.data[index]));
                                                },
                                              ),
                                            );
                                          } else {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),
                                      FutureBuilder(
                                        future: Api().getAllFinishedMatches(),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            return Expanded(
                                              child: ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (ctx) =>
                                                                  MatchDetails(
                                                                      match: snapshot
                                                                              .data[
                                                                          index]))),
                                                      child: matchTile(context,
                                                          snapshot.data[index]));
                                                },
                                              ),
                                            );
                                          } else {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      )
                                    ]),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

        

        );
  }
}
