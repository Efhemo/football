
import 'package:flutter/cupertino.dart';
import 'package:football/domain/model/league_table_local.dart';

class TableItem {
  final int id;
  final int position;
  final String avatar;
  final String name;
  final int point;
  final int gamePlayed;
  final int goalDifference;

  TableItem({@required this.id, this.position, this.avatar, this.name, this.point,
      this.gamePlayed, this.goalDifference});

  static TableItem fromTeamLocal(LeagueTableLocal lt) =>
      TableItem(id: lt.id, position: lt.position, avatar: lt.teamLogo, name: lt.teamName,
          point: lt.points, gamePlayed: lt.playedGames, goalDifference: lt.goalDifference);
}