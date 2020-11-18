import 'package:flutter/cupertino.dart';
import 'package:football/domain/model/league_table_local.dart';

class Team {
  final int id;
  final String leauge;
  final String name;
  final String code;
  final String emblemUrl;
  final int position;

  Team({ @required this.id, @required this.leauge, @required this.name, this.code, @required this.emblemUrl, this.position});

  static Team fromTeamLocal(LeagueTableLocal leagueTableLocal) =>
      Team(id: leagueTableLocal.teamId, leauge: leagueTableLocal.leagueName, name: leagueTableLocal.teamName, emblemUrl: leagueTableLocal.teamLogo);
}