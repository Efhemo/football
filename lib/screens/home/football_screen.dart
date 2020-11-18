import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:football/data/data.dart';
import 'package:football/screens/home/search_screen.dart';
import 'package:football/utils/custom_route.dart';
import 'package:football/viewmodel/provider.dart';
import 'package:football/widgets/team_item.dart';
import 'package:football/widgets/widget.dart';
import 'package:provider/provider.dart';

class FootballScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverCustomAppBar (
              flexibleTitle: "Football",
              trailing: InkWell(
                onTap: () async {
                  Provider.of<NewsProvider>(context, listen: false).fetchNews();
                },
                child: Container(
                    margin: const EdgeInsets.all(9.0),
                    padding: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: CachedNetworkImageProvider(user.avatar),
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: CustomSearchBar(
                  onTapSearch: () => Navigator.of(context).push(Util.slideUpRoute(SearchScreen())),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: const ListHeader(
                    headerTitle: "Football league", trailingTitle: "See All"),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(leagues
                    .asMap()
                    .map((i, league) => MapEntry(
                        i,
                        TeamItem(
                          title: league.name,
                          imageUrl: league.emblemUrl,
                          id: league.id,
                          subtitle: league.area,
                          trailing: league.currentMatchday.toString(),
                          onTap: () {Navigator.pushNamed(context, "/footballDetails", arguments: league);}
                        ))).values.toList())),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: const ListHeader(
                    headerTitle: "Top Teams", trailingTitle: "See All"),
              ),
            ),
            Consumer<FootballProvider>(
              builder: (context, provider, child){
                return SliverList(
                    delegate: SliverChildListDelegate(provider.fiveTopTeams()
                        .asMap()
                        .map((i, team) => MapEntry(
                        i,
                        TeamItem(
                            title: team.name,
                            imageUrl: team.emblemUrl,
                            id: team.id,
                            subtitle: team.leauge,
                            trailing: team.position.toString(),
                            onTap: () {print("id is ${team.name}");}
                        ))).values.toList()));
              },
            )
          ],
        ),
      ),
    );
  }


}
