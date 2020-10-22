
import 'package:flutter/cupertino.dart';

class Team {
  final int id;
  final String leauge;
  final String name;
  final String code;
  final String emblemUrl;
  final int position;

  Team({ @required this.id, @required this.leauge, @required this.name, this.code, @required this.emblemUrl, this.position});
}