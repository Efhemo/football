/// competition : {"id":2021,"name":"Premier League","code":"PL"}
/// standings : [{"stage":"REGULAR_SEASON","type":"TOTAL","group":null,"table":[{"position":1,"team":{"id":338,...

class TableResponse {
  Competition _competition;
  List<Standings> _standings;

  Competition get competition => _competition;
  List<Standings> get standings => _standings;

  TableResponse({
      Competition competition, 
      List<Standings> standings}){
    _competition = competition;
    _standings = standings;
}

  TableResponse.fromJson(dynamic json) {
    _competition = json["competition"] != null ? Competition.fromJson(json["competition"]) : null;
    if (json["standings"] != null) {
      _standings = [];
      json["standings"].forEach((v) {
        _standings.add(Standings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_competition != null) {
      map["competition"] = _competition.toJson();
    }
    if (_standings != null) {
      map["standings"] = _standings.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// stage : "REGULAR_SEASON"
/// type : "TOTAL"
/// group : null
/// table : [{"position":1,"team":{"id":338,"name":"Leicester City FC"...

class Standings {
  String _stage;
  String _type;
  dynamic _group;
  List<Table> _table;

  String get stage => _stage;
  String get type => _type;
  dynamic get group => _group;
  List<Table> get table => _table;

  Standings({
      String stage, 
      String type, 
      dynamic group, 
      List<Table> table}){
    _stage = stage;
    _type = type;
    _group = group;
    _table = table;
}

  Standings.fromJson(dynamic json) {
    _stage = json["stage"];
    _type = json["type"];
    _group = json["group"];
    if (json["table"] != null) {
      _table = [];
      json["table"].forEach((v) {
        _table.add(Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["stage"] = _stage;
    map["type"] = _type;
    map["group"] = _group;
    if (_table != null) {
      map["table"] = _table.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// position : 1
/// team : {"id":338,"name":"Leicester City FC","crestUrl":"https://crests.football-data.org/338.svg"}
/// playedGames : 8
/// form : "W,W,W,L,L"
/// won : 6
/// draw : 0
/// lost : 2
/// points : 18
/// goalsFor : 18
/// goalsAgainst : 9
/// goalDifference : 9

class Table {
  int _position;
  TeamRemote _team;
  int _playedGames;
  String _form;
  int _won;
  int _draw;
  int _lost;
  int _points;
  int _goalsFor;
  int _goalsAgainst;
  int _goalDifference;

  int get position => _position;
  TeamRemote get team => _team;
  int get playedGames => _playedGames;
  String get form => _form;
  int get won => _won;
  int get draw => _draw;
  int get lost => _lost;
  int get points => _points;
  int get goalsFor => _goalsFor;
  int get goalsAgainst => _goalsAgainst;
  int get goalDifference => _goalDifference;

  Table({
      int position, 
      TeamRemote team,
      int playedGames, 
      String form, 
      int won, 
      int draw, 
      int lost, 
      int points, 
      int goalsFor, 
      int goalsAgainst, 
      int goalDifference}){
    _position = position;
    _team = team;
    _playedGames = playedGames;
    _form = form;
    _won = won;
    _draw = draw;
    _lost = lost;
    _points = points;
    _goalsFor = goalsFor;
    _goalsAgainst = goalsAgainst;
    _goalDifference = goalDifference;
}

  Table.fromJson(dynamic json) {
    _position = json["position"];
    _team = json["team"] != null ? TeamRemote.fromJson(json["team"]) : null;
    _playedGames = json["playedGames"];
    _form = json["form"];
    _won = json["won"];
    _draw = json["draw"];
    _lost = json["lost"];
    _points = json["points"];
    _goalsFor = json["goalsFor"];
    _goalsAgainst = json["goalsAgainst"];
    _goalDifference = json["goalDifference"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["position"] = _position;
    if (_team != null) {
      map["team"] = _team.toJson();
    }
    map["playedGames"] = _playedGames;
    map["form"] = _form;
    map["won"] = _won;
    map["draw"] = _draw;
    map["lost"] = _lost;
    map["points"] = _points;
    map["goalsFor"] = _goalsFor;
    map["goalsAgainst"] = _goalsAgainst;
    map["goalDifference"] = _goalDifference;
    return map;
  }

}

/// id : 338
/// name : "Leicester City FC"
/// crestUrl : "https://crests.football-data.org/338.svg"

class TeamRemote {
  int _id;
  String _name;
  String _crestUrl;

  int get id => _id;
  String get name => _name;
  String get crestUrl => _crestUrl;

  TeamRemote({
      int id, 
      String name, 
      String crestUrl}){
    _id = id;
    _name = name;
    _crestUrl = crestUrl;
}

  TeamRemote.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _crestUrl = json["crestUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["crestUrl"] = _crestUrl;
    return map;
  }

}

/// id : 2021
/// name : "Premier League"
/// code : "PL"

class Competition {
  int _id;
  String _name;
  String _code;

  int get id => _id;
  String get name => _name;
  String get code => _code;

  Competition({
      int id, 
      String name, 
      String code}){
    _id = id;
    _name = name;
    _code = code;
}

  Competition.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["code"] = _code;
    return map;
  }

}