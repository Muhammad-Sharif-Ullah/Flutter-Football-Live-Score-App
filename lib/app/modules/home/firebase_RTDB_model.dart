// To parse this JSON data, do
//
//     final firebaseRtdbModel = firebaseRtdbModelFromJson(jsonString);

import 'dart:convert';

FirebaseRtdbModel firebaseRtdbModelFromJson(String str) => FirebaseRtdbModel.fromJson(json.decode(str));

String firebaseRtdbModelToJson(FirebaseRtdbModel data) => json.encode(data.toJson());

class FirebaseRtdbModel {
  FirebaseRtdbModel({
    this.fixture,
  });

  Map<String, FixtureValue> fixture;

  factory FirebaseRtdbModel.fromJson(Map<String, dynamic> json) => FirebaseRtdbModel(
    fixture: Map.from(json["fixture"]).map((k, v) => MapEntry<String, FixtureValue>(k, FixtureValue.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "fixture": Map.from(fixture).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class FixtureValue {
  FixtureValue({
    this.fixtureGet,
    this.paging,
    this.parameters,
    this.response,
    this.results,
  });

  String fixtureGet;
  Paging paging;
  Parameters parameters;
  List<Response> response;
  int results;

  factory FixtureValue.fromJson(Map<String, dynamic> json) => FixtureValue(
    fixtureGet: json["get"],
    paging: Paging.fromJson(json["paging"]),
    parameters: Parameters.fromJson(json["parameters"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    results: json["results"],
  );

  Map<String, dynamic> toJson() => {
    "get": fixtureGet,
    "paging": paging.toJson(),
    "parameters": parameters.toJson(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "results": results,
  };
}

class Paging {
  Paging({
    this.current,
    this.total,
  });

  int current;
  int total;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    current: json["current"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "total": total,
  };
}

class Parameters {
  Parameters({
    this.league,
    this.season,
  });

  String league;
  String season;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    league: json["league"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "league": league,
    "season": season,
  };
}

class Response {
  Response({
    this.fixture,
    this.goals,
    this.league,
    this.score,
    this.teams,
  });

  ResponseFixture fixture;
  Goals goals;
  League league;
  Score score;
  Teams teams;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    fixture: ResponseFixture.fromJson(json["fixture"]),
    goals: json["goals"] == null ? null : Goals.fromJson(json["goals"]),
    league: League.fromJson(json["league"]),
    score: json["score"] == null ? null : Score.fromJson(json["score"]),
    teams: Teams.fromJson(json["teams"]),
  );

  Map<String, dynamic> toJson() => {
    "fixture": fixture.toJson(),
    "goals": goals == null ? null : goals.toJson(),
    "league": league.toJson(),
    "score": score == null ? null : score.toJson(),
    "teams": teams.toJson(),
  };
}

class ResponseFixture {
  ResponseFixture({
    this.date,
    this.id,
    this.periods,
    this.referee,
    this.status,
    this.timestamp,
    this.timezone,
    this.venue,
  });

  DateTime date;
  int id;
  Periods periods;
  String referee;
  Status status;
  int timestamp;
  String timezone;
  Venue venue;

  factory ResponseFixture.fromJson(Map<String, dynamic> json) => ResponseFixture(
    date: DateTime.parse(json["date"]),
    id: json["id"],
    periods: json["periods"] == null ? null : Periods.fromJson(json["periods"]),
    referee: json["referee"] == null ? null : json["referee"],
    status: Status.fromJson(json["status"]),
    timestamp: json["timestamp"],
    timezone: json["timezone"],
    venue: Venue.fromJson(json["venue"]),
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "id": id,
    "periods": periods == null ? null : periods.toJson(),
    "referee": referee == null ? null : referee,
    "status": status.toJson(),
    "timestamp": timestamp,
    "timezone": timezone,
    "venue": venue.toJson(),
  };
}

class Periods {
  Periods({
    this.first,
    this.second,
  });

  int first;
  int second;

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
    first: json["first"],
    second: json["second"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "second": second,
  };
}

class Status {
  Status({
    this.elapsed,
    this.long,
    this.short,
  });

  int elapsed;
  String long;
  String short;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    elapsed: json["elapsed"] == null ? null : json["elapsed"],
    long: json["long"],
    short: json["short"],
  );

  Map<String, dynamic> toJson() => {
    "elapsed": elapsed == null ? null : elapsed,
    "long": long,
    "short": short,
  };
}






class Venue {
  Venue({
    this.city,
    this.id,
    this.name,
  });

  String city;
  int id;
  dynamic name;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    city: json["city"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "id": id,
    "name": name,
  };
}





class Goals {
  Goals({
    this.away,
    this.home,
  });

  int away;
  int home;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
    away: json["away"],
    home: json["home"],
  );

  Map<String, dynamic> toJson() => {
    "away": away,
    "home": home,
  };
}

class League {
  League({
    this.country,
    this.flag,
    this.id,
    this.logo,
    this.name,
    this.round,
    this.season,
  });

  String country;
  String flag;
  int id;
  String logo;
  String name;
  String round;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
    country: json["country"],
    flag: json["flag"],
    id: json["id"],
    logo: json["logo"],
    name: json["name"],
    round: json["round"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "flag": flag,
    "id": id,
    "logo": logo,
    "name": name,
    "round": round,
    "season": season,
  };
}



class Score {
  Score({
    this.fulltime,
    this.halftime,
  });

  Goals fulltime;
  Goals halftime;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    fulltime: Goals.fromJson(json["fulltime"]),
    halftime: Goals.fromJson(json["halftime"]),
  );

  Map<String, dynamic> toJson() => {
    "fulltime": fulltime.toJson(),
    "halftime": halftime.toJson(),
  };
}

class Teams {
  Teams({
    this.away,
    this.home,
  });

  Away away;
  Away home;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
    away: Away.fromJson(json["away"]),
    home: Away.fromJson(json["home"]),
  );

  Map<String, dynamic> toJson() => {
    "away": away.toJson(),
    "home": home.toJson(),
  };
}

class Away {
  Away({
    this.id,
    this.logo,
    this.name,
    this.winner,
  });

  int id;
  String logo;
  String name;
  bool winner;

  factory Away.fromJson(Map<String, dynamic> json) => Away(
    id: json["id"],
    logo: json["logo"],
    name: json["name"],
    winner: json["winner"] == null ? null : json["winner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "name": name,
    "winner": winner == null ? null : winner,
  };
}

