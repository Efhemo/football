import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/data/data.dart';
import 'package:football/model/league.dart';
import 'package:football/model/table_item.dart';
import 'package:football/widgets/widget.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final League league = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverCustomAppBar(
              title: league.name,
              iconLeading: Icons.arrow_back_ios,
              onLeadingTap: () {
                Navigator.pop(context);
              }),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final tableItem = table[index];
              return _tableItem(tableItem);
            }, childCount: table.length),
          )
        ],
      ),
    );
  }

  Widget _tableItem(TableItem tableItem){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 18.0),
              child: Text(
                tableItem.id.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SvgPicture.network(tableItem.avatar,
                    width: 16.0, height: 16.0)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                tableItem.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 4.0, horizontal: 16.0),
              child: Text(
                tableItem.gamePlayed.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 4.0, horizontal: 16.0),
              child: Text(
                tableItem.goalDifference.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 4.0, horizontal: 16.0),
              child: Text(
                tableItem.point.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            )
          ],
        ),
        Divider(thickness: 1.5, indent: 2, endIndent: 2)
      ],
    );
  }
}
