import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:football/data/data.dart';
import 'package:football/screens/search_screen.dart';
import 'package:football/widgets/widget.dart';

class FootballScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverCustomAppBar(
              title: "Football",
              trailing: InkWell(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.all(9.0),
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: CachedNetworkImageProvider(user.avatar),
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: CustomSearchBar(
                  onTapSearch: () => Navigator.of(context).push(_createRoute()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SearchScreen(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
