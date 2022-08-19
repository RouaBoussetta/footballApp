import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';
import '../model/footballmatch.dart';

class Api {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2019&league=39";

  final String apiLineup =
      "https://v3.football.api-sports.io/fixtures/lineups?fixture=592872";

  final String apiLive = "https://v3.football.api-sports.io/fixtures?live=all";

  Map<String, String> headers = {
    'x-rapidapi-key': Constant.API_KEY,
  };
  Future<List<FootballMatch>> getAllMatches() async {
    
    var request = http.Request('GET', Uri.parse(apiUrl)); 
    final prefs = await SharedPreferences.getInstance();
      request.headers.addAll(headers);
    // print("****Request****");
    //print(request);

    
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
 
      if (response.statusCode == 200) {
      var body = jsonDecode(respStr);
      prefs.setString('all', json.encode(body));

    print("*****Response From All football matches*****");
    print(prefs.getString('all'));

    // print(body['response']);
  /*  List<dynamic> matchesList =
        json.decode(prefs.getString('all')!)['response'];
*/
         List<dynamic> matchesList =      body['response'];


    List<FootballMatch> matches = matchesList
        .map((dynamic item) => FootballMatch.fromJson(item))
        .toList();
    return matches;
      } else {
        throw ("No Match Found ");
  }
  }

  Future<List<FootballMatch>> getAllLiveMatches() async {
      var request = http.Request('GET', Uri.parse(apiLive));
    final prefs = await SharedPreferences.getInstance();
     request.headers.addAll(headers);
    // print("****Request****");
    //print(request);
      final response = await request.send();
      final respStr = await response.stream.bytesToString();

      if (response.statusCode == 200) {
      var body = jsonDecode(respStr);

       prefs.setString('live', json.encode(body));

    print("************live****************");
    print(prefs.getString('live'));

    // print("*****Response From All football matches*****");

    // print(body['response']);
   // List<dynamic> matchesList =        json.decode(prefs.getString('live')!)['response'];
    List<dynamic> matchesList =body['response'];
    List<FootballMatch> matches = matchesList
        .map((dynamic item) => FootballMatch.fromJson(item))
        .toList();
    return matches;
       } else {
        throw ("No Match Found ");
      }
  }

  Future<List<FootballMatch>> getAllFinishedMatches() async {
      var request = http.Request('GET', Uri.parse(apiLive));
    final prefs = await SharedPreferences.getInstance();
       request.headers.addAll(headers);
    // print("****Request****");
    //print(request);
     final response = await request.send();
     final respStr = await response.stream.bytesToString();

      if (response.statusCode == 200) {
       var body = jsonDecode(respStr);

       prefs.setString('finished', json.encode(body));

    print("************Finished****************");
    //  print(prefs.getString('finished'));

    // print("*****Response From All football matches*****");

    // print(body['response']);
    //List<dynamic> matchesList =        json.decode(prefs.getString('finished')!)['response'];

     List<dynamic> matchesList =body['response'];
    List<FootballMatch> matches = matchesList
        .map((dynamic item) => FootballMatch.fromJson(item))
        .toList();
    return matches;
     } else {
     throw ("No Match Found ");
  }
  }

  Future<List<FootballMatch>> getAllupcommingMatches() async {
      var request = http.Request('GET', Uri.parse(apiLive));
    final prefs = await SharedPreferences.getInstance();
      request.headers.addAll(headers);
    // print("****Request****");
    //print(request);
     final response = await request.send();
     final respStr = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        var body = jsonDecode(respStr);

      prefs.setString('upcoming', json.encode(body));

    print("************upcoming****************");
    //print(prefs.getString('upcoming'));

    // print("*****Response From All football matches*****");

    // print(body['response']);
   // List<dynamic> matchesList =        json.decode(prefs.getString('upcoming')!)['response'];

         List<dynamic> matchesList =body['response'];
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
    final prefs = await SharedPreferences.getInstance();
      request.headers.addAll(headers);
   
      final response = await request.send();
   final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {

       
      var body = jsonDecode(respStr);

    print("************lineup****************");

  //  print(prefs.getString('lineup'));
    //List<dynamic> lineupList = json.decode(prefs.getString('lineup')!);
     List<dynamic> lineupList =  body['response'];

    var lineup = lineupList.map((item) => Group.fromJson(item)).toList();
    print(lineup.length);

    prefs.setString('lineup', json.encode(lineupList));

    return lineup;
       } else {
        throw Exception('Failed to load this match');

      }
  }
}
