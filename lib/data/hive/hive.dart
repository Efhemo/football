import 'package:football/data/model/articles_local.dart';
import 'package:football/data/model/games_local.dart';
import 'package:football/data/model/league_table_local.dart';
import 'package:hive/hive.dart';

class HiveSetup {

  static Future<void> init() async {
    Hive.registerAdapter(ArticleLocalAdapter());
    await Hive.openBox<ArticleLocal>(HiveSetup.Article);

    Hive.registerAdapter(LeagueTableLocalAdapter());
    await Hive.openBox<LeagueTableLocal>(HiveSetup.LeagueTeam);

    Hive.registerAdapter(GamesLocalAdapter());
    await Hive.openBox<GamesLocal>(HiveSetup.Games);
  }

  static const Article = "articleLocal";
  static const LeagueTeam = "leagueTeam";
  static const Games = "games";
}
