import 'package:flutter/cupertino.dart';

class League {
  final int id;
  final String area;
  final String name;
  final String code;
  final String emblemUrl;
  final int currentMatchday;
  final String startDate;
  final String endDate;

  League( {@required this.id, this.area, @required this.name, this.code,
  @required this.emblemUrl, @required this.currentMatchday, this.startDate, this.endDate});

}