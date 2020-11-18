import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football/data/data.dart';
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
    Future.delayed(Duration.zero, (){
      Provider.of<FootballProvider>(context, listen: false).fetchTable(widget.league.id);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverCustomAppBar(
                  title: widget.league.name,
                  iconLeading: Icons.arrow_back_ios,
                  onLeadingTap: () {
                    Navigator.pop(context);
                  }),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: CustomSearchBar(
                    onTapSearch: () => Navigator.of(context)
                        .push(Util.slideUpRoute(SearchScreen())),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Consumer<FootballProvider>(
                  builder: (context, footballProvider, child) {
                    if (footballProvider.failure != null) {
                      Util.showSnackBar(context, footballProvider.failure.message,
                              ()=> Provider.of<FootballProvider>(context, listen: false).fetchTable(widget.league.id));
                    }
                    return Container(
                      height: 90.0,
                      child: _teamsWidget(footballProvider.teams(widget.league.id)),
                    );
                  } ,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
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
                                fontWeight: FontWeight.w500, color: Colors.white),
                          )),
                      const SizedBox(width: 6.0),
                      const ListHeader(headerTitle: "Live Highlights")
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 250,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: liveMatch.length,
                      itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: LiveMatchItem(match: liveMatch[index]))),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  child: ListHeader(
                    headerTitle: "All games",
                    onTrailingTap: () {
                      Navigator.of(context).pushNamed("/table", arguments: widget.league);
                    },
                    trailingTitle: "See Table",
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                    child: MatchItem(match: scheduledMatch[index])),
                childCount: scheduledMatch.length,
              ))
            ],
          ),
        ),
        Consumer<FootballProvider>(builder: (buildContext, footballProvider, child) {
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
