
import 'package:flutter/cupertino.dart';

class TableItem {
  final int id;
  final String avatar;
  final String name;
  final int point;
  final int gamePlayed;
  final int goalDifference;

  TableItem({@required this.id, this.avatar, this.name, this.point,
      this.gamePlayed, this.goalDifference});
}