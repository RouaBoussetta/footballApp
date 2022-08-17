import 'package:flutter/material.dart';
 
import 'package:footballapp/model/footballmatch.dart';
import 'package:footballapp/views/matches.dart';
import 'package:footballapp/views/team.dart';

import 'goal.dart';
 
  
Widget pageBody (List<FootballMatch> matches) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                team("Local",  matches[0].teams!.home!.logo!,
                 matches[0].teams!.home!.name!),
              goal ( matches[0].fixture!.status!.elapsed!,
                matches[0].goals!.home!,  matches[0].goals!.away!),
              team("Visitor",  matches[0].teams!.away!.logo!,
                 matches[0].teams!.away!.name!),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: matchList(matches)
      ),
    ],
  );
}