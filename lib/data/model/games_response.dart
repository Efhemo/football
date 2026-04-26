import 'package:football/data/model/table_response.dart';

class GamesResponse {
  Competition? competition;
  List<Matches>? matches;

  GamesResponse({this.competition, this.matches});

  GamesResponse.fromJson(Map<String, dynamic> json) {
    competition = json['competition'] != null
        ? Competition.fromJson(json['competition'])
        : null;
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (competition != null) {
      data['competition'] = competition!.toJson();
    }
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Matches {
  int? id;
  String? utcDate;
  String? status;
  int? matchday;
  String? lastUpdated;
  Score? score;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;

  Matches(
      {this.id,
        this.utcDate,
        this.status,
        this.matchday,
        this.lastUpdated,
        this.score,
        this.homeTeam,
        this.awayTeam});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    utcDate = json['utcDate'];
    status = json['status'];
    matchday = json['matchday'];
    lastUpdated = json['lastUpdated'];
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
    homeTeam = json['homeTeam'] != null
        ? HomeTeam.fromJson(json['homeTeam'])
        : null;
    awayTeam = json['awayTeam'] != null
        ? HomeTeam.fromJson(json['awayTeam'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['utcDate'] = utcDate;
    data['status'] = status;
    data['matchday'] = matchday;
    data['lastUpdated'] = lastUpdated;
    if (score != null) {
      data['score'] = score!.toJson();
    }
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }
    return data;
  }
}

class Score {
  String? winner;
  String? duration;
  FullTime? fullTime;
  FullTime? halfTime;
  ExtraTime? extraTime;
  ExtraTime? penalties;

  Score(
      {this.winner,
        this.duration,
        this.fullTime,
        this.halfTime,
        this.extraTime,
        this.penalties});

  Score.fromJson(Map<String, dynamic> json) {
    winner = json['winner'];
    duration = json['duration'];
    fullTime = json['fullTime'] != null
        ? FullTime.fromJson(json['fullTime'])
        : null;
    halfTime = json['halfTime'] != null
        ? FullTime.fromJson(json['halfTime'])
        : null;
    extraTime = json['extraTime'] != null
        ? ExtraTime.fromJson(json['extraTime'])
        : null;
    penalties = json['penalties'] != null
        ? ExtraTime.fromJson(json['penalties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['winner'] = winner;
    data['duration'] = duration;
    if (fullTime != null) {
      data['fullTime'] = fullTime!.toJson();
    }
    if (halfTime != null) {
      data['halfTime'] = halfTime!.toJson();
    }
    if (extraTime != null) {
      data['extraTime'] = extraTime!.toJson();
    }
    if (penalties != null) {
      data['penalties'] = penalties!.toJson();
    }
    return data;
  }
}

class FullTime {
  int? homeTeam;
  int? awayTeam;

  FullTime({this.homeTeam, this.awayTeam});

  FullTime.fromJson(Map<String, dynamic> json) {
    homeTeam = json['homeTeam'];
    awayTeam = json['awayTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homeTeam'] = homeTeam;
    data['awayTeam'] = awayTeam;
    return data;
  }
}

class ExtraTime {
  int? homeTeam;
  int? awayTeam;

  ExtraTime({this.homeTeam, this.awayTeam});

  ExtraTime.fromJson(Map<String, dynamic> json) {
    homeTeam = json['homeTeam'];
    awayTeam = json['awayTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homeTeam'] = homeTeam;
    data['awayTeam'] = awayTeam;
    return data;
  }
}

class HomeTeam {
  int? id;
  String? name;

  HomeTeam({this.id, this.name});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
