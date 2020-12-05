import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football/model/league.dart';
import 'package:football/model/team.dart';
import 'package:football/utils/custom_route.dart';
import 'package:football/viewmodel/provider.dart';
import 'package:football/widgets/widget.dart';
import 'package:provider/provider.dart';
import '../screen.dart';

class FootballDetailsScreen extends StatefulWidget {
  final League league;

  FootballDetailsScreen(this.league);

  @override
  _FootballDetailsScreenState createState() => _FootballDetailsScreenState();
}

class _FootballDetailsScreenState extends State<FootballDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<FootballProvider>(context, listen: false)
          .fetchTable(widget.league.id);
      Provider.of<FootballProvider>(context, listen: false)
          .fetchGames(widget.league.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Consumer<FootballProvider>(
              builder: (buildContext, provider, child) {
                final teams  = provider.teams(widget.league.id);
                if (provider.failure != null) {
                  Util.showSnackBar(
                      context, provider.failure.message, () {
                    provider.fetchTable(widget.league.id);
                    provider.fetchGames(widget.league.id);
                  });
                }
            return CustomScrollView(
              slivers: <Widget>[
                SliverCustomAppBar(
                    title: widget.league.name,
                    iconLeading: Icons.arrow_back_ios,
                    onLeadingTap: () {
                      Navigator.pop(context);
                    }),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: CustomSearchBar(
                      onTapSearch: () => Navigator.of(context)
                          .push(Util.slideUpRoute(SearchScreen())),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 90.0,
                    child: _teamsWidget(teams),
                  )
                ),
                //LIVE HIGHLIGHTS TEXT
                SliverToBoxAdapter(
                  child: provider.liveMatch.isEmpty ? SizedBox.shrink() :
                  Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3.0)),
                                  child: const Text(
                                    "Live",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )),
                              const SizedBox(width: 6.0),
                              const ListHeader(headerTitle: "Live Highlights")
                            ],
                          ),
                        ),
                ),
                SliverToBoxAdapter(
                  child: provider.liveMatch.isEmpty
                      ? SizedBox.shrink()
                      : Container(
                          height: 250,
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 17.0, horizontal: 10.0),
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.liveMatch.length,
                              itemBuilder: (context, index) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: LiveMatchItem(
                                      match: provider.liveMatch[index]))),
                        ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    child: ListHeader(
                      headerTitle: "All games",
                      onTrailingTap: () {
                        Navigator.of(context)
                            .pushNamed("/table", arguments: widget.league);
                      },
                      trailingTitle: teams.isNotEmpty ? "See Table" : "",
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 12.0),
                      child: MatchItem(match: provider.nonLiveMatch[index])),
                  childCount: provider.nonLiveMatch.length,
                ))
              ],
            );
          }),
        ),
        Consumer<FootballProvider>(
            builder: (buildContext, footballProvider, child) {
          return Visibility(
            visible: footballProvider.state == ViewState.loading,
            child: SpinKitSquareCircle(
              color: Theme.of(context).accentColor,
              size: 50.0,
            ),
          );
        })
      ],
    );
  }

  Widget _teamsWidget(List<Team> teams) {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: teams.length,
        itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: RoundImage(
                  imageUrl: teams[index].emblemUrl,
                  isElevated: true,
                  onTap: () {}),
            ));
  }
}
