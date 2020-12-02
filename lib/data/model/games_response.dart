import 'package:football/data/model/table_response.dart';

class GamesResponse {
  Competition competition;
  List<Matches> matches;

  GamesResponse({this.competition, this.matches});

  GamesResponse.fromJson(Map<String, dynamic> json) {
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    if (json['matches'] != null) {
      matches = new List<Matches>();
      json['matches'].forEach((v) {
        matches.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.matches != null) {
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Matches {
  int id;
  String utcDate;
  String status;
  int matchday;
  Score score;
  HomeTeam homeTeam;
  HomeTeam awayTeam;

  Matches(
      {this.id,
        this.utcDate,
        this.status,
        this.matchday,
        this.score,
        this.homeTeam,
        this.awayTeam});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    utcDate = json['utcDate'];
    status = json['status'];
    matchday = json['matchday'];
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    homeTeam = json['homeTeam'] != null
        ? new HomeTeam.fromJson(json['homeTeam'])
        : null;
    awayTeam = json['awayTeam'] != null
        ? new HomeTeam.fromJson(json['awayTeam'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['utcDate'] = this.utcDate;
    data['status'] = this.status;
    data['matchday'] = this.matchday;
    if (this.score != null) {
      data['score'] = this.score.toJson();
    }
    if (this.homeTeam != null) {
      data['homeTeam'] = this.homeTeam.toJson();
    }
    if (this.awayTeam != null) {
      data['awayTeam'] = this.awayTeam.toJson();
    }
    return data;
  }
}

class Score {
  String winner;
  String duration;
  FullTime fullTime;
  FullTime halfTime;
  ExtraTime extraTime;
  ExtraTime penalties;

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
        ? new FullTime.fromJson(json['fullTime'])
        : null;
    halfTime = json['halfTime'] != null
        ? new FullTime.fromJson(json['halfTime'])
        : null;
    extraTime = json['extraTime'] != null
        ? new ExtraTime.fromJson(json['extraTime'])
        : null;
    penalties = json['penalties'] != null
        ? new ExtraTime.fromJson(json['penalties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winner'] = this.winner;
    data['duration'] = this.duration;
    if (this.fullTime != null) {
      data['fullTime'] = this.fullTime.toJson();
    }
    if (this.halfTime != null) {
      data['halfTime'] = this.halfTime.toJson();
    }
    if (this.extraTime != null) {
      data['extraTime'] = this.extraTime.toJson();
    }
    if (this.penalties != null) {
      data['penalties'] = this.penalties.toJson();
    }
    return data;
  }
}

class FullTime {
  int homeTeam;
  int awayTeam;

  FullTime({this.homeTeam, this.awayTeam});

  FullTime.fromJson(Map<String, dynamic> json) {
    homeTeam = json['homeTeam'];
    awayTeam = json['awayTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homeTeam'] = this.homeTeam;
    data['awayTeam'] = this.awayTeam;
    return data;
  }
}

class ExtraTime {
  int homeTeam;
  int awayTeam;

  ExtraTime({this.homeTeam, this.awayTeam});

  ExtraTime.fromJson(Map<String, dynamic> json) {
    homeTeam = json['homeTeam'];
    awayTeam = json['awayTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homeTeam'] = this.homeTeam;
    data['awayTeam'] = this.awayTeam;
    return data;
  }
}

class HomeTeam {
  int id;
  String name;

  HomeTeam({this.id, this.name});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
