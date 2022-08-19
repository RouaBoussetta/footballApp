class FootballMatch {
  Fixture? fixture;
  League? league;
  Teams? teams;
  Goals? goals;
  Score? score;

  FootballMatch(
      {this.fixture, this.league, this.teams, this.goals, this.score});

  FootballMatch.fromJson(Map<String, dynamic> json) {
    fixture =
        json['fixture'] != null ? new Fixture.fromJson(json['fixture']) : null;
    league =
        json['league'] != null ? new League.fromJson(json['league']) : null;
    teams = json['teams'] != null ? new Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? new Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fixture != null) {
      data['fixture'] = this.fixture!.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league!.toJson();
    }
    if (this.teams != null) {
      data['teams'] = this.teams!.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals!.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    return data;
  }
}

class Fixture {
  int? id;
  String? referee;
  String? timezone;
  String? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  Fixture(
      {this.id,
      this.referee,
      this.timezone,
      this.date,
      this.timestamp,
      this.periods,
      this.venue,
      this.status});

  Fixture.fromJson(Map<String, dynamic> json) {
     id =  int.parse(json['id']==null?'0':json['id'].toString())   ;

    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = int.parse(json['timestamp']==null?'0':json['timestamp'].toString()) ;
    periods =
        json['periods'] != null ? new Periods.fromJson(json['periods']) : null;
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['referee'] = this.referee;
    data['timezone'] = this.timezone;
    data['date'] = this.date;
    data['timestamp'] = this.timestamp;
    if (this.periods != null) {
      data['periods'] = this.periods!.toJson();
    }
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Periods {
  int? first;
  int? second;

  Periods({this.first, this.second});

  Periods.fromJson(Map<String, dynamic> json) {
    first =   int.parse(json['first']==null?'0':json['first'].toString()) ;
    second = int.parse(json['second']==null?'0':json['second'].toString()) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? city;

  Venue({this.id, this.name, this.city});

  Venue.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']==null?'0':json['id'].toString()) ;
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    return data;
  }
}

class Status {
  String? long;
  String? short;
  int? elapsed;

  Status({this.long, this.short, this.elapsed});

  Status.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    elapsed = int.parse(json['elapsed']==null?'0':json['elapsed'].toString()) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['long'] = this.long;
    data['short'] = this.short;
    data['elapsed'] = this.elapsed;
    return data;
  }
}

class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  String? round;

  League(
      {this.id,
      this.name,
      this.country,
      this.logo,
      this.flag,
      this.season,
      this.round});

  League.fromJson(Map<String, dynamic> json) {
     id =  int.parse(json['id']==null?'0':json['id'].toString())   ;
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season =  int.parse(json['season']==null?'0':json['season'].toString());
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    data['round'] = this.round;
    return data;
  }
}

class Teams {
  Home? home;
  Home? away;

  Teams({this.home, this.away});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
    away = json['away'] != null ? new Home.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away!.toJson();
    }
    return data;
  }
}

class Home {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  Home({this.id, this.name, this.logo, this.winner});

  Home.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']==null?'0':json['id'].toString()) ;
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['winner'] = this.winner;
    return data;
  }
}

class Goals {
  int? home;
  int? away;

  Goals({this.home, this.away});

  Goals.fromJson(Map<String, dynamic> json) {
    home = int.parse(json['home']==null?'0':json['home'].toString()) ;
    away = int.parse(json['away']==null?'0':json['away'].toString()) ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = this.home;
    data['away'] = this.away;
    return data;
  }
}

class Score {
  Goals? halftime;
  Goals? fulltime;
  Extratime? extratime;
  Extratime? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime =
        json['halftime'] != null ? new Goals.fromJson(json['halftime']) : null;
    fulltime =
        json['fulltime'] != null ? new Goals.fromJson(json['fulltime']) : null;
    extratime = json['extratime'] != null
        ? new Extratime.fromJson(json['extratime'])
        : null;
    penalty = json['penalty'] != null
        ? new Extratime.fromJson(json['penalty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.halftime != null) {
      data['halftime'] = this.halftime!.toJson();
    }
    if (this.fulltime != null) {
      data['fulltime'] = this.fulltime!.toJson();
    }
    if (this.extratime != null) {
      data['extratime'] = this.extratime!.toJson();
    }
    if (this.penalty != null) {
      data['penalty'] = this.penalty!.toJson();
    }
    return data;
  }
}

class Extratime {
  int? home;
  int? away;

  Extratime({this.home, this.away});

  Extratime.fromJson(Map<String, dynamic> json) {
    home = int.parse(json['home']==null?'0':json['home'].toString());
    away = int.parse(json['away']==null?'0':json['away'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = this.home;
    data['away'] = this.away;
    return data;
  }
}

class Lineup{

  List<Group>? response;
 Lineup(
      {this.response});
Lineup.fromJson(Map<String, dynamic> json) {
    
    
    if (json['response'] != null) {
      response = <Group>[];
      json['response'].forEach((v) {
        response!.add(new Group.fromJson(v));
      });
    }
    
    
  }

}

class Group {
  List<Team>? team;
  String? formation;
  List<StartXI>? startXI;
List<StartXI>? substitutes;
  Coach? coach;

  Group(
      {this.team, this.formation, this.startXI, this.substitutes, this.coach});

  Group.fromJson(Map<String, dynamic> json) {

          if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(new Team.fromJson(v));
      });
    }


     formation = json['formation'];
    if (json['startXI'] != null) {
      startXI = <StartXI>[];
      json['startXI'].forEach((v) {
        startXI!.add(new StartXI.fromJson(v));
      });
    }

        if (json['substitutes'] != null) {
      substitutes = <StartXI>[];
      json['substitutes'].forEach((v) {
        substitutes!.add(new StartXI.fromJson(v));
      });
    }

 
    
    coach = json['coach'] != null ? new Coach.fromJson(json['coach']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.map((v) => v.toJson()).toList();
    }
    data['formation'] = this.formation;
    if (this.startXI != null) {
      data['startXI'] = this.startXI!.map((v) => v.toJson()).toList();
    }
     
    if (this.coach != null) {
      data['coach'] = this.coach!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? logo;
  Colorss? colors;

  Team({this.id, this.name, this.logo, this.colors});

  Team.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']==null?'0':json['id'].toString()) ;
    name = json['name'];
    logo = json['logo'];
    colors =
        json['colors'] != null ? new Colorss.fromJson(json['colors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    if (this.colors != null) {
      data['colors'] = this.colors!.toJson();
    }
    return data;
  }
}

class Colorss {
  TeamPlayer? player;
  TeamPlayer? goalkeeper;

  Colorss(int i, {this.player, this.goalkeeper});

  Colorss.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new TeamPlayer.fromJson(json['player']) : null;
    goalkeeper = json['goalkeeper'] != null
        ? new TeamPlayer.fromJson(json['goalkeeper'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.goalkeeper != null) {
      data['goalkeeper'] = this.goalkeeper!.toJson();
    }
    return data;
  }
}

class TeamPlayer {
  String? primary;
  String? number;
  String? border;

  TeamPlayer({this.primary, this.number, this.border});

 

 

  TeamPlayer.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    number =  json['number'];
    border = json['border'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['number'] = this.number;
    data['border'] = this.border;
    return data;
  }
}


class Player {
   
  int? id;
  String? name;
  int? number;
    String? pos;
      String? grid;

  Player({this.id, this.name, this.number,this.pos,this.grid});

 

 

  Player.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']==null?'0':json['id'].toString()) ;
    
    name = json['name'];
    number = int.parse(json['number']==null?'0':json['number'].toString()) ;
    
    pos = json['pos'];
    
    grid = json['grid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
       data['pos'] = this.pos;
    data['grid'] = this.grid;
    return data;
  }
}

class StartXI {
  Player? player;

  StartXI({this.player});

  StartXI.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

 

 
class Coach {
  int? id;
  String? name;
  String? photo;

  Coach({this.id, this.name, this.photo});

  Coach.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']==null?'0':json['id'].toString()) ;
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}

 