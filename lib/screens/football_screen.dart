import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football/data/data.dart';
import 'package:football/widgets/sliver_custom_appbar.dart';

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
                onTap: (){},
                child: Container(
                    margin: const EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: CachedNetworkImageProvider(user.avatar),)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
