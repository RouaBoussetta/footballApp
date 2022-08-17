import 'package:flutter/material.dart';
import 'package:footballapp/model/footballmatch.dart';
import 'package:footballapp/views/match.dart';

Widget matchTile(BuildContext ctx, FootballMatch match) {
  var homeGoal = match.goals!.home;
  var awayGoal = match.goals!.away;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return   Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    match.teams!.home!.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Image.network(
                  match.teams!.home!.logo!,
                  width: 36.0,
                ),
                Expanded(
                  child: Text(
                    "$homeGoal - $awayGoal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Image.network(
                  match.teams!.away!.logo!,
                  width: 36.0,
                ),
                Expanded(
                  child: Text(
                    match.teams!.away!.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    )
  ;
}
