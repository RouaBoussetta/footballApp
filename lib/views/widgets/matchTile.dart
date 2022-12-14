import 'package:flutter/material.dart';
import 'package:footballapp/model/footballmatch.dart';


Widget matchTile(BuildContext ctx, FootballMatch  match ) {

  
  var homeGoal = match.goals!.home;
  var awayGoal = match.goals!.away;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;
 
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                 match.teams!.home!.name! ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Image.network(
match.teams!.home!.logo! ,          width: 36.0,
            ),
            Expanded(
              child: Text(
                "$homeGoal - $awayGoal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Image.network(
              match.teams!.away!.logo!,
              width: 36.0,
            ),
            Expanded(
              child: Text(
          match.teams!.away!.name! ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),

        
      ),
    
    Divider()
    ],
  );
}
