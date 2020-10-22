import 'package:football/model/league.dart';
import 'package:football/model/team.dart';
import 'package:football/model/user.dart';

final User  user = User(name: "Femi", nickName: "Efhem", avatar: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80");

final leagues = [
  League(id: 2001, area: "Europe", name: "UEFA Champions League", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/b/bf/UEFA_Champions_League_logo_2.svg", currentMatchday: 1),
  League(id: 2021, area: "England", name: "Premier League", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/a/ae/Flag_of_the_United_Kingdom.svg", currentMatchday: 5),
  //League(id: 2019, area: "Italy", name: "Serie A", emblemUrl: "https://crests.football-data.org/SA.svg", currentMatchday: 4),
  League(id: 2014, area: "Spain", name: "La Liga", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg", currentMatchday: 7),
  League(id: 2015, area: "France", name: "Ligue 1", emblemUrl: "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg", currentMatchday: 8),
  League(id: 2002, area: "Germany", name: "Bundesliga", emblemUrl: "https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg", currentMatchday: 5),
];

// top teams can be filtered/deduced from each league by their position(first and/or second postion) on their league
final topTeams = [
  Team(id: 258, leauge: "England", name: "Chelsea", emblemUrl: "https://crests.football-data.org/61.svg"),
  Team(id: 259, leauge: "England", name: "Man City", emblemUrl: "https://crests.football-data.org/65.svg"),
  Team(id: 259, leauge: "France", name: "Paris Saint-Germain", emblemUrl: "https://crests.football-data.org/524.svg"),
  Team(id: 200, leauge: "La Liga", name: "Real Madrid", emblemUrl: "https://crests.football-data.org/86.svg"),
];