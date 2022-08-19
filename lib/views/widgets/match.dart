import 'package:flutter/material.dart';
import 'package:footballapp/model/footballmatch.dart';
import 'package:footballapp/services/api.dart';
import 'package:http/http.dart';

import 'goal.dart';
import 'lineupColumn.dart';
import 'team.dart';

class MatchDetails extends StatelessWidget {
  const MatchDetails({Key? key, required this.match}) : super(key: key);

  final FootballMatch match;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: const Text(
            "Match Details",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black54),
                  height: 200,
                  child: Card(
                    elevation: 100,
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          team(
                            "Home",
                            match.teams!.home!.logo!,
                            match.teams!.home!.name!,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          goal(match.fixture!.status!.elapsed!,
                              match.goals!.home!, match.goals!.away!),
                          SizedBox(
                            width: 10,
                          ),
                          team(
                            "Away",
                            match.teams!.away!.logo!,
                            match.teams!.away!.name!,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.amber.withOpacity(0.3),
                  indicatorColor: Colors.amber,
                  tabs: [
                    const Tab(
                      child: Text('Home Team'),
                    ),
                    Tab(
                      child: Text('Away Team'),
                    ),
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(250.0),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.black87),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 9000,
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                    child: Column(
                      children: [
                        Image.network(
                          match.teams!.home!.logo!,
                          width: 150,
                        ),
                        FutureBuilder(
                            future: Api().getLineups(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return LineupColumn(snapshot.data[0]);
                              }
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 13.0, right: 13.0, bottom: 13.0, top: 25),
                    child: Column(
                      children: [
                        Image.network(
                          match.teams!.away!.logo!,
                          width: 150,
                        ),
                        FutureBuilder(
                            future: Api().getLineups(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return LineupColumn(snapshot.data[1]);
                              }
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

 