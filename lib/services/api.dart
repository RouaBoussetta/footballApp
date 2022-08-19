import 'dart:async';
import 'dart:convert';

 import 'package:footballapp/constant/constant.dart';
import 'package:http/http.dart' as http;

import '../model/footballmatch.dart';

class Api {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2019&league=39";

  final String apiLineup =
      "https://v3.football.api-sports.io/fixtures/lineups?fixture=592872";


  Map<String, String> headers = {
    'x-rapidapi-key': Constant.API_KEY,
  };
  Future<List<FootballMatch>> getAllMatches() async {
    var request = http.Request('GET', Uri.parse(apiUrl));

    request.headers.addAll(headers);
  // print("****Request****");
    //print(request);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      var body = jsonDecode(respStr);
    
     // print("*****Response From All football matches*****");

     // print(body['response']);
      List<dynamic> matchesList = body['response'];
      List<FootballMatch> matches = matchesList
          .map((dynamic item) => FootballMatch.fromJson(item))
          .toList();
      return matches;
    } else {
      throw ("No Match Found ");
    }
  }



  Future<List<Group>> getLineups() async {
    var request = http.Request('GET', Uri.parse(apiLineup));

    request.headers.addAll(headers);
   

    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      var body = jsonDecode(respStr);
      print("*****Lineups*****");
      print(body['response']);
           
  List<dynamic> lineupList = body['response'];
 

      var lineup = lineupList
          .map((item) =>  Group.fromJson(item)).toList()
          ;
          print(lineup.length);
      return lineup;
    } else {
      throw Exception('Failed to load this match');
    }
  }

}
