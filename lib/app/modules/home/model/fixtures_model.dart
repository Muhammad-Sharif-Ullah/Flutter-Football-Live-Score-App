// To parse this JSON data, do
//
//     final fixturesModel = fixturesModelFromJson(jsonString);

import 'dart:convert';

FixturesModel fixturesModelFromJson(String str) => FixturesModel.fromJson(json.decode(str));

String fixturesModelToJson(FixturesModel data) => json.encode(data.toJson());

class FixturesModel {
  FixturesModel({
    this.fixturesModelGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  String fixturesModelGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<ResponseData> response;

  factory FixturesModel.fromJson(Map<String, dynamic> json) => FixturesModel(
    fixturesModelGet: json["get"],
    parameters: Parameters.fromJson(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromJson(json["paging"]),
    response: List<ResponseData>.from(json["response"].map((x) => ResponseData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "get": fixturesModelGet,
    "parameters": parameters.toJson(),
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "results": results,
    "paging": paging.toJson(),
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
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
    this.season,
    this.league,
  });

  String season;
  String league;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    season: json["season"],
    league: json["league"],
  );

  Map<String, dynamic> toJson() => {
    "season": season,
    "league": league,
  };
}

class ResponseData {
  ResponseData({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.score,
  });

  Fixture fixture;
  League league;
  Goals teams;
  Goals goals;
  Score score;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    fixture: Fixture.fromJson(json["fixture"]),
    league: League.fromJson(json["league"]),
    teams: Goals.fromJson(json["teams"]),
    goals: Goals.fromJson(json["goals"]),
    score: Score.fromJson(json["score"]),
  );

  Map<String, dynamic> toJson() => {
    "fixture": fixture.toJson(),
    "league": league.toJson(),
    "teams": teams.toJson(),
    "goals": goals.toJson(),
    "score": score.toJson(),
  };
}

class Fixture {
  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  int id;
  String referee;
  Timezone timezone;
  DateTime date;
  int timestamp;
  Periods periods;
  Venue venue;
  Status status;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
    id: json["id"],
    referee: json["referee"] == null ? null : json["referee"],
    timezone: timezoneValues.map[json["timezone"]],
    date: DateTime.parse(json["date"]),
    timestamp: json["timestamp"],
    periods: Periods.fromJson(json["periods"]),
    venue: Venue.fromJson(json["venue"]),
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referee": referee == null ? null : referee,
    "timezone": timezoneValues.reverse[timezone],
    "date": date.toIso8601String(),
    "timestamp": timestamp,
    "periods": periods.toJson(),
    "venue": venue.toJson(),
    "status": status.toJson(),
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
    first: json["first"] == null ? null : json["first"],
    second: json["second"] == null ? null : json["second"],
  );

  Map<String, dynamic> toJson() => {
    "first": first == null ? null : first,
    "second": second == null ? null : second,
  };
}

class Status {
  Status({
    this.long,
    this.short,
    this.elapsed,
  });

  Long long;
  Short short;
  int elapsed;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    long: longValues.map[json["long"]],
    short: shortValues.map[json["short"]],
    elapsed: json["elapsed"] == null ? null : json["elapsed"],
  );

  Map<String, dynamic> toJson() => {
    "long": longValues.reverse[long],
    "short": shortValues.reverse[short],
    "elapsed": elapsed == null ? null : elapsed,
  };
}

enum Long { MATCH_FINISHED, MATCH_POSTPONED, NOT_STARTED, HALFTIME }

final longValues = EnumValues({
  "Halftime": Long.HALFTIME,
  "Match Finished": Long.MATCH_FINISHED,
  "Match Postponed": Long.MATCH_POSTPONED,
  "Not Started": Long.NOT_STARTED
});

enum Short { FT, PST, NS, HT }

final shortValues = EnumValues({
  "FT": Short.FT,
  "HT": Short.HT,
  "NS": Short.NS,
  "PST": Short.PST
});

enum Timezone { UTC }

final timezoneValues = EnumValues({
  "UTC": Timezone.UTC
});

class Venue {
  Venue({
    this.id,
    this.name,
    this.city,
  });

  int id;
  String name;
  City city;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["id"],
    name: json["name"],
    city: cityValues.map[json["city"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": cityValues.reverse[city],
  };
}

enum City { BURNLEY, LONDON, LIVERPOOL, MANCHESTER, WEST_BROMWICH, FALMER_EAST_SUSSEX, SHEFFIELD, BIRMINGHAM, LEEDS_WEST_YORKSHIRE, LEICESTER_LEICESTERSHIRE, NEWCASTLE_UPON_TYNE, SOUTHAMPTON_HAMPSHIRE, WOLVERHAMPTON_WEST_MIDLANDS }

final cityValues = EnumValues({
  "Birmingham": City.BIRMINGHAM,
  "Burnley": City.BURNLEY,
  "Falmer, East Sussex": City.FALMER_EAST_SUSSEX,
  "Leeds, West Yorkshire": City.LEEDS_WEST_YORKSHIRE,
  "Leicester, Leicestershire": City.LEICESTER_LEICESTERSHIRE,
  "Liverpool": City.LIVERPOOL,
  "London": City.LONDON,
  "Manchester": City.MANCHESTER,
  "Newcastle upon Tyne": City.NEWCASTLE_UPON_TYNE,
  "Sheffield": City.SHEFFIELD,
  "Southampton, Hampshire": City.SOUTHAMPTON_HAMPSHIRE,
  "West Bromwich": City.WEST_BROMWICH,
  "Wolverhampton, West Midlands": City.WOLVERHAMPTON_WEST_MIDLANDS
});

class Goals {
  Goals({
    this.home,
    this.away,
  });

  dynamic home;
  dynamic away;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toJson() => {
    "home": home,
    "away": away,
  };
}

class AwayClass {
  AwayClass({
    this.id,
    this.name,
    this.logo,
    this.winner,
  });

  int id;
  AwayName name;
  String logo;
  bool winner;

  factory AwayClass.fromJson(Map<String, dynamic> json) => AwayClass(
    id: json["id"],
    name: awayNameValues.map[json["name"]],
    logo: json["logo"],
    winner: json["winner"] == null ? null : json["winner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": awayNameValues.reverse[name],
    "logo": logo,
    "winner": winner == null ? null : winner,
  };
}

enum AwayName { MANCHESTER_UNITED, SOUTHAMPTON, ARSENAL, LEEDS, ASTON_VILLA, EVERTON, LEICESTER, NEWCASTLE, CHELSEA, WOLVES, WEST_HAM, SHEFFIELD_UTD, LIVERPOOL, WEST_BROM, FULHAM, BURNLEY, CRYSTAL_PALACE, BRIGHTON, TOTTENHAM, MANCHESTER_CITY }

final awayNameValues = EnumValues({
  "Arsenal": AwayName.ARSENAL,
  "Aston Villa": AwayName.ASTON_VILLA,
  "Brighton": AwayName.BRIGHTON,
  "Burnley": AwayName.BURNLEY,
  "Chelsea": AwayName.CHELSEA,
  "Crystal Palace": AwayName.CRYSTAL_PALACE,
  "Everton": AwayName.EVERTON,
  "Fulham": AwayName.FULHAM,
  "Leeds": AwayName.LEEDS,
  "Leicester": AwayName.LEICESTER,
  "Liverpool": AwayName.LIVERPOOL,
  "Manchester City": AwayName.MANCHESTER_CITY,
  "Manchester United": AwayName.MANCHESTER_UNITED,
  "Newcastle": AwayName.NEWCASTLE,
  "Sheffield Utd": AwayName.SHEFFIELD_UTD,
  "Southampton": AwayName.SOUTHAMPTON,
  "Tottenham": AwayName.TOTTENHAM,
  "West Brom": AwayName.WEST_BROM,
  "West Ham": AwayName.WEST_HAM,
  "Wolves": AwayName.WOLVES
});

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.round,
  });

  int id;
  LeagueName name;
  Country country;
  String logo;
  String flag;
  int season;
  String round;

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: leagueNameValues.map[json["name"]],
    country: countryValues.map[json["country"]],
    logo: json["logo"],
    flag: json["flag"],
    season: json["season"],
    round: json["round"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": leagueNameValues.reverse[name],
    "country": countryValues.reverse[country],
    "logo": logo,
    "flag": flag,
    "season": season,
    "round": round,
  };
}

enum Country { ENGLAND }

final countryValues = EnumValues({
  "England": Country.ENGLAND
});

enum LeagueName { PREMIER_LEAGUE }

final leagueNameValues = EnumValues({
  "Premier League": LeagueName.PREMIER_LEAGUE
});

class Score {
  Score({
    this.halftime,
    this.fulltime,
    this.extratime,
    this.penalty,
  });

  Goals halftime;
  Goals fulltime;
  Goals extratime;
  Goals penalty;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    halftime: Goals.fromJson(json["halftime"]),
    fulltime: Goals.fromJson(json["fulltime"]),
    extratime: Goals.fromJson(json["extratime"]),
    penalty: Goals.fromJson(json["penalty"]),
  );

  Map<String, dynamic> toJson() => {
    "halftime": halftime.toJson(),
    "fulltime": fulltime.toJson(),
    "extratime": extratime.toJson(),
    "penalty": penalty.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
