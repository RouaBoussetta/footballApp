import 'package:flutter/material.dart';

import '../model/footballmatch.dart';
import 'match.dart';
import 'matchTile.dart';

Widget matchList(List<FootballMatch> matches) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.green,
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
              fontSize: 24.0,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const MatchDetails())),
                    child: matchTile(context, matches[index]));
              },
            ),
          ),
        ],
      ),
    ),
  );
}
