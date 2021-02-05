// To parse this JSON data, do
//
//     final firebaseRtdbModel2 = firebaseRtdbModel2FromJson(jsonString);

import 'dart:convert';

FirebaseRtdbModel2 firebaseRtdbModel2FromJson(String str) => FirebaseRtdbModel2.fromJson(json.decode(str));

String firebaseRtdbModel2ToJson(FirebaseRtdbModel2 data) => json.encode(data.toJson());

class FirebaseRtdbModel2 {
  FirebaseRtdbModel2({
    this.fixture,
  });

  Map<String, FixtureValue> fixture;

  factory FirebaseRtdbModel2.fromJson(Map<String, dynamic> json) => FirebaseRtdbModel2(
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
  List<MatchSummery> response;
  int results;

  factory FixtureValue.fromJson(Map<String, dynamic> json) => FixtureValue(
    fixtureGet: json["get"],
    paging: Paging.fromJson(json["paging"]),
    parameters: Parameters.fromJson(json["parameters"]),
    response: List<MatchSummery>.from(json["response"].map((x) => MatchSummery.fromJson(x))),
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

class MatchSummery {
  MatchSummery({
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

  factory MatchSummery.fromJson(Map<String, dynamic> json) => MatchSummery(
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
  Timezone timezone;
  Venue venue;

  factory ResponseFixture.fromJson(Map<String, dynamic> json) => ResponseFixture(
    date: DateTime.parse(json["date"]),
    id: json["id"],
    periods: json["periods"] == null ? null : Periods.fromJson(json["periods"]),
    referee: json["referee"] == null ? null : json["referee"],
    status: Status.fromJson(json["status"]),
    timestamp: json["timestamp"],
    timezone: timezoneValues.map[json["timezone"]],
    venue: Venue.fromJson(json["venue"]),
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "id": id,
    "periods": periods == null ? null : periods.toJson(),
    "referee": referee == null ? null : referee,
    "status": status.toJson(),
    "timestamp": timestamp,
    "timezone": timezoneValues.reverse[timezone],
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
  Long long;
  Short short;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    elapsed: json["elapsed"] == null ? null : json["elapsed"],
    long: longValues.map[json["long"]],
    short: shortValues.map[json["short"]],
  );

  Map<String, dynamic> toJson() => {
    "elapsed": elapsed == null ? null : elapsed,
    "long": longValues.reverse[long],
    "short": shortValues.reverse[short],
  };
}

enum Long { MATCH_FINISHED, MATCH_POSTPONED, NOT_STARTED }

final longValues = EnumValues({
  "Match Finished": Long.MATCH_FINISHED,
  "Match Postponed": Long.MATCH_POSTPONED,
  "Not Started": Long.NOT_STARTED
});

enum Short { FT, PST, NS }

final shortValues = EnumValues({
  "FT": Short.FT,
  "NS": Short.NS,
  "PST": Short.PST
});

enum Timezone { UTC }

final timezoneValues = EnumValues({
  "UTC": Timezone.UTC
});

class Venue {
  Venue({
    this.city,
    this.id,
    this.name,
  });

  City city;
  int id;
  VenueName name;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    city: cityValues.map[json["city"]],
    id: json["id"],
    name: venueNameValues.map[json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "city": cityValues.reverse[city],
    "id": id,
    "name": venueNameValues.reverse[name],
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

enum VenueName { TURF_MOOR, SELHURST_PARK, CRAVEN_COTTAGE, ANFIELD, ETIHAD_STADIUM, TOTTENHAM_HOTSPUR_STADIUM, THE_HAWTHORNS, LONDON_STADIUM, THE_AMERICAN_EXPRESS_COMMUNITY_STADIUM, BRAMALL_LANE, EMIRATES_STADIUM, VILLA_PARK, STAMFORD_BRIDGE, GOODISON_PARK, ELLAND_ROAD, KING_POWER_STADIUM, OLD_TRAFFORD, ST_JAMES_PARK, ST_MARY_S_STADIUM, MOLINEUX_STADIUM }

final venueNameValues = EnumValues({
  "Anfield": VenueName.ANFIELD,
  "Bramall Lane": VenueName.BRAMALL_LANE,
  "Craven Cottage": VenueName.CRAVEN_COTTAGE,
  "Elland Road": VenueName.ELLAND_ROAD,
  "Emirates Stadium": VenueName.EMIRATES_STADIUM,
  "Etihad Stadium": VenueName.ETIHAD_STADIUM,
  "Goodison Park": VenueName.GOODISON_PARK,
  "King Power Stadium": VenueName.KING_POWER_STADIUM,
  "London Stadium": VenueName.LONDON_STADIUM,
  "Molineux Stadium": VenueName.MOLINEUX_STADIUM,
  "Old Trafford": VenueName.OLD_TRAFFORD,
  "Selhurst Park": VenueName.SELHURST_PARK,
  "Stamford Bridge": VenueName.STAMFORD_BRIDGE,
  "St. James' Park": VenueName.ST_JAMES_PARK,
  "St. Mary's Stadium": VenueName.ST_MARY_S_STADIUM,
  "The American Express Community Stadium": VenueName.THE_AMERICAN_EXPRESS_COMMUNITY_STADIUM,
  "The Hawthorns": VenueName.THE_HAWTHORNS,
  "Tottenham Hotspur Stadium": VenueName.TOTTENHAM_HOTSPUR_STADIUM,
  "Turf Moor": VenueName.TURF_MOOR,
  "Villa Park": VenueName.VILLA_PARK
});

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

  Country country;
  String flag;
  int id;
  String logo;
  LeagueName name;
  Round round;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
    country: countryValues.map[json["country"]],
    flag: json["flag"],
    id: json["id"],
    logo: json["logo"],
    name: leagueNameValues.map[json["name"]],
    round: roundValues.map[json["round"]],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "country": countryValues.reverse[country],
    "flag": flag,
    "id": id,
    "logo": logo,
    "name": leagueNameValues.reverse[name],
    "round": roundValues.reverse[round],
    "season": season,
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

enum Round { REGULAR_SEASON_1, REGULAR_SEASON_2, REGULAR_SEASON_3, REGULAR_SEASON_4, REGULAR_SEASON_5, REGULAR_SEASON_6, REGULAR_SEASON_7, REGULAR_SEASON_8, REGULAR_SEASON_9, REGULAR_SEASON_10, REGULAR_SEASON_11, REGULAR_SEASON_12, REGULAR_SEASON_13, REGULAR_SEASON_14, REGULAR_SEASON_15, REGULAR_SEASON_16, REGULAR_SEASON_17, REGULAR_SEASON_18, REGULAR_SEASON_19, REGULAR_SEASON_20, REGULAR_SEASON_21, REGULAR_SEASON_22, REGULAR_SEASON_23, REGULAR_SEASON_24, REGULAR_SEASON_25, REGULAR_SEASON_26, REGULAR_SEASON_27, REGULAR_SEASON_28, REGULAR_SEASON_29, REGULAR_SEASON_30, REGULAR_SEASON_31, REGULAR_SEASON_32, REGULAR_SEASON_33, REGULAR_SEASON_34, REGULAR_SEASON_35, REGULAR_SEASON_36, REGULAR_SEASON_37, REGULAR_SEASON_38 }

final roundValues = EnumValues({
  "Regular Season - 1": Round.REGULAR_SEASON_1,
  "Regular Season - 10": Round.REGULAR_SEASON_10,
  "Regular Season - 11": Round.REGULAR_SEASON_11,
  "Regular Season - 12": Round.REGULAR_SEASON_12,
  "Regular Season - 13": Round.REGULAR_SEASON_13,
  "Regular Season - 14": Round.REGULAR_SEASON_14,
  "Regular Season - 15": Round.REGULAR_SEASON_15,
  "Regular Season - 16": Round.REGULAR_SEASON_16,
  "Regular Season - 17": Round.REGULAR_SEASON_17,
  "Regular Season - 18": Round.REGULAR_SEASON_18,
  "Regular Season - 19": Round.REGULAR_SEASON_19,
  "Regular Season - 2": Round.REGULAR_SEASON_2,
  "Regular Season - 20": Round.REGULAR_SEASON_20,
  "Regular Season - 21": Round.REGULAR_SEASON_21,
  "Regular Season - 22": Round.REGULAR_SEASON_22,
  "Regular Season - 23": Round.REGULAR_SEASON_23,
  "Regular Season - 24": Round.REGULAR_SEASON_24,
  "Regular Season - 25": Round.REGULAR_SEASON_25,
  "Regular Season - 26": Round.REGULAR_SEASON_26,
  "Regular Season - 27": Round.REGULAR_SEASON_27,
  "Regular Season - 28": Round.REGULAR_SEASON_28,
  "Regular Season - 29": Round.REGULAR_SEASON_29,
  "Regular Season - 3": Round.REGULAR_SEASON_3,
  "Regular Season - 30": Round.REGULAR_SEASON_30,
  "Regular Season - 31": Round.REGULAR_SEASON_31,
  "Regular Season - 32": Round.REGULAR_SEASON_32,
  "Regular Season - 33": Round.REGULAR_SEASON_33,
  "Regular Season - 34": Round.REGULAR_SEASON_34,
  "Regular Season - 35": Round.REGULAR_SEASON_35,
  "Regular Season - 36": Round.REGULAR_SEASON_36,
  "Regular Season - 37": Round.REGULAR_SEASON_37,
  "Regular Season - 38": Round.REGULAR_SEASON_38,
  "Regular Season - 4": Round.REGULAR_SEASON_4,
  "Regular Season - 5": Round.REGULAR_SEASON_5,
  "Regular Season - 6": Round.REGULAR_SEASON_6,
  "Regular Season - 7": Round.REGULAR_SEASON_7,
  "Regular Season - 8": Round.REGULAR_SEASON_8,
  "Regular Season - 9": Round.REGULAR_SEASON_9
});

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
  AwayName name;
  bool winner;

  factory Away.fromJson(Map<String, dynamic> json) => Away(
    id: json["id"],
    logo: json["logo"],
    name: awayNameValues.map[json["name"]],
    winner: json["winner"] == null ? null : json["winner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "name": awayNameValues.reverse[name],
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
