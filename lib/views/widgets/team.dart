import 'package:flutter/material.dart';

Widget team(String team, String logoUrl, String teamName) {
  return   Wrap(
    direction: Axis.vertical,
    children: [
      Column(
          children: [
            Text(
              team,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
             SizedBox(
                                    height: 5,
                                  ),
             Image.network(
                                   logoUrl,
                                    height: 90,
                                    width: 90,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Text(
                                      teamName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
          ],
       
      ),
    ],
  );
}