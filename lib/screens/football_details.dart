import 'package:flutter/material.dart';
import 'package:football/data/data.dart';
import 'package:football/model/league.dart';
import 'package:football/model/team.dart';
import 'package:football/utils/custom_route.dart';
import 'package:football/widgets/widget.dart';
import 'screen.dart';

class FootballDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final League league = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverCustomAppBar(
              title: league.name,
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
            child: Container(
              height: 90.0,
              child: _teamsWidget(topTeams),
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
                onTrailingTap: () {},
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
