 import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() {
Api().getAllMatches();
}

class Api {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2019&league=39";
  Map<String, String> get headers =>{
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "4fd4b2e7b66634ce771961cdcc3cfeaf",
    'Content-type':'application/json'
  };

  Future<List<FootballMatch>> getAllMatches() async {
 

var headerss= {
  'x-rapidapi-key': '4fd4b2e7b66634ce771961cdcc3cfeaf',
  'x-rapidapi-host': 'v3.football.api-sports.io'
};
var request = http.Request('GET', Uri.parse(apiUrl));

request.headers.addAll(headerss);

print (request);
final response = await request.send();
final respStr = await response.stream.bytesToString();
print("object");
if (response.statusCode == 200) {
  print('ok');
  print(respStr);
}
else {
  print(response.reasonPhrase);
}

var body;
    if (response.statusCode == 200) {
      body = jsonDecode(response.toString());
      List<dynamic> matchesList = body['response'];
      print('API service ${body}');
      List<FootballMatch> matches = matchesList
          .map((dynamic item) => FootballMatch.fromJson(item))
          .toList();
      return matches;
    }else {
      throw("can't ");
    }
  }
}
class  FootballMatch {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
   FootballMatch(this.fixture, this.home, this.away, this.goal);

  factory  FootballMatch.fromJson(Map<String, dynamic> json) {
    return  FootballMatch(
      Fixture.fromJson(json['fixture']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
      Goal.fromJson(json['goals']));
  }
}

class Fixture {
  int id;
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(json['id'], json['date'], Status.fromJson(json['status']));
  }
}

class Status {
  int elapsedTime;
  String long;
  Status(this.elapsedTime, this.long);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['elapsed'], json['long']);
  }
}

class Team {
  int id;
  String name;
  String logoUrl;
  bool? winner;
  Team(this.id, this.name, this.logoUrl, this.winner);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logo'], json['winner']);
  }
}

class Goal {
  int? home;
  int? away;
  Goal(this.home, this.away);

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(json['home'], json['away']);
  }
}