import 'package:football/model/league.dart';
import 'package:football/model/match.dart';
import 'package:football/model/team.dart';
import 'package:football/model/user.dart';

final User  user = User(name: "Femi", nickName: "Efhem", avatar: "https://avatars0.githubusercontent.com/u/40208739?s=400&u=8b3a525a482244fccf8dca5ab04c77d482ca8aae&v=4");

final leagues = [
  League(id: 2001, area: "Europe", name: "UEFA Champions League", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/b/bf/UEFA_Champions_League_logo_2.svg", currentMatchday: 1),
  League(id: 2021, area: "England", name: "Premier League", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/a/ae/Flag_of_the_United_Kingdom.svg", currentMatchday: 5),
  League(id: 2019, area: "Italy", name: "Serie A", emblemUrl: "https://crests.football-data.org/SA.svg", currentMatchday: 4),
  League(id: 2014, area: "Spain", name: "La Liga", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg", currentMatchday: 7),
  League(id: 2015, area: "France", name: "Ligue 1", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg", currentMatchday: 8),
  League(id: 2002, area: "Germany", name: "Bundesliga", emblemUrl: "https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg", currentMatchday: 5),
];

// top teams can be filtered/deduced from each league by their position(first and/or second postion) on their league
//or top teams could be as a result of their point divided by number of games played (kind of)
final topTeams = [
  Team(id: 258, leauge: "England", name: "Chelsea", emblemUrl: "https://crests.football-data.org/61.svg", position: 1),
  Team(id: 259, leauge: "England", name: "Man City", emblemUrl: "https://crests.football-data.org/65.svg", position: 2),
  Team(id: 259, leauge: "France", name: "Paris Saint-Germain", emblemUrl: "https://crests.football-data.org/524.svg", position: 1),
  Team(id: 200, leauge: "La Liga", name: "Real Madrid", emblemUrl: "https://crests.football-data.org/86.svg", position: 1),
];

final liveMatch = [
  Match(id: 1, homeImageUrl: "https://crests.football-data.org/61.svg",
      awayImageUrl: "https://crests.football-data.org/65.svg",
      currentMinute: "15", isLive: true,
      league: "UEFA Champions League", homeTeam: "Chelsea", awayTeam: "Man City", homeScore: 2, awayScore: 3, playTime: "13:30", playDate: "18 JAN" ),
  Match(id: 2, homeImageUrl: "https://crests.football-data.org/524.svg",
      awayImageUrl: "https://crests.football-data.org/86.svg",
      currentMinute: "78", isLive: true,
      league: "UEFA Champions League", homeTeam: "Paris Saint-Germain",
      awayTeam: "Real Madrid", homeScore: 2, awayScore: 3, playTime: "13:30", playDate: "18 JAN" ),
  Match(id: 3, homeImageUrl: "https://crests.football-data.org/524.svg",
      awayImageUrl: "https://crests.football-data.org/86.svg",
      currentMinute: "110", isLive: true,
      league: "UEFA Champions League", homeTeam: "Paris Saint-Germain",
      awayTeam: "Real Madrid", homeScore: 2, awayScore: 3, playTime: "13:30", playDate: "18 JAN" ),
];

final scheduledMatch = [
  Match(id: 1, homeImageUrl: "https://crests.football-data.org/61.svg",
      awayImageUrl: "https://crests.football-data.org/524.svg",
      currentMinute: null, isLive: false,
      league: "UEFA Champions League", homeTeam: "Chelsea", awayTeam: "Paris Saint-Germain", homeScore: 5, awayScore: 5, playTime: "20:30", playDate: "20 JAN" ),
  Match(id: 2, homeImageUrl: "https://crests.football-data.org/65.svg",
      awayImageUrl: "https://crests.football-data.org/86.svg",
      currentMinute: null, isLive: false,
      league: "UEFA Champions League", homeTeam: "Man City",
      awayTeam: "Real Madrid", homeScore: null, awayScore: null, playTime: "13:30", playDate: "18 JAN" )
];
