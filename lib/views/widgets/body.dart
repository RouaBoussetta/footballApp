import 'package:flutter/material.dart';

import 'package:footballapp/model/footballmatch.dart';
 
 import 'match.dart';
import 'matchTile.dart';

Widget pageBody(List<FootballMatch> matches) {
  return Column(
    children: [
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: new DecorationImage(
                image: new NetworkImage(
                    "https://i.pinimg.com/474x/20/a0/f1/20a0f129498dc20d15d6de5081d9c821.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            const Text(
                              "Match",
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "of the day",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),


                            ),

                                       const SizedBox(height: 30,),

                          ],
                        ),
                      ),
                    ],
                  ),
                 
                  Center(
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.network(
                                matches[0].teams!.home!.logo!,
                                height: 110,
                                width: 110,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  matches[0].teams!.home!.name!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.network(
                                "https://pnggrid.com/wp-content/uploads/2021/04/UEFA-Champions-League-Logo-PNG-White-1024x939.png",
                                height: 90,
                                width: 90,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                matches[0].fixture!.date!.substring(11,16),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.network(
                               matches[0].teams!.away!.logo!,
                                height: 110,
                                width: 110,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                matches[0].teams!.away!.name!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius:   BorderRadius.only(
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
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: matches.length,
                    itemBuilder: (context, index) {
                      return  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>     MatchDetails(match: matches[index] ))),
                      child: matchTile(context, matches[index]));
                    },
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
