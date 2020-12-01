import 'package:football/data/model/articles_local.dart';
import 'package:football/data/model/league_table_local.dart';
import 'package:hive/hive.dart';

class HiveSetup {

  static Future<void> init() async {

    Hive.registerAdapter(ArticleLocalAdapter(), 0);
    await Hive.openBox<ArticleLocal>(HiveSetup.Article);

    Hive.registerAdapter(LeagueTableLocalAdapter(), 1);
    await Hive.openBox<LeagueTableLocal>(HiveSetup.LeagueTeam);
  }

  static const Article = "articleLocal";
  static const LeagueTeam = "leagueTeam";

}