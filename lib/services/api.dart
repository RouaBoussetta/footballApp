import 'dart:async';
import 'dart:convert';

 import 'package:footballapp/constant/constant.dart';
import 'package:http/http.dart' as http;

import '../model/footballmatch.dart';

class Api {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2019&league=39";

  Map<String, String> headers = {
    'x-rapidapi-key': Constant.API_KEY,
  };
  Future<List<FootballMatch>> getAllMatches() async {
    var request = http.Request('GET', Uri.parse(apiUrl));

    request.headers.addAll(headers);
    print("****Request****");
    print(request);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      var body = jsonDecode(respStr);
      print("*****Full Response*****");
      print(body);
      print("*****Response*****");

      print(body['response']);
      List<dynamic> matchesList = body['response'];
      List<FootballMatch> matches = matchesList
          .map((dynamic item) => FootballMatch.fromJson(item))
          .toList();
      return matches;
    } else {
      throw ("No Match Found ");
    }
  }
}
