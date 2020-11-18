import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/model/league.dart';
import 'package:football/model/table_item.dart';
import 'package:football/viewmodel/football_provider.dart';
import 'package:football/widgets/widget.dart';
import 'package:provider/provider.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final League league = ModalRoute.of(context).settings.arguments;
    final nameWidth = MediaQuery.of(context).size.width / 2.4;
    return Scaffold(
      body: Consumer<FootballProvider>(
        builder: (context, provider, child) {
          final table  = provider.table(league.id);
          return CustomScrollView(
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
                  return _tableItem(tableItem, nameWidth);
                }, childCount: table.length),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _tableItem(TableItem tableItem, double nameWidth) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 40.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Text(
                tableItem.position.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: SvgPicture.network(tableItem.avatar,
                    width: 16.0, height: 16.0)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              width: nameWidth,
              child: Text(
                tableItem.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: 50.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Text(
                tableItem.gamePlayed.toString(),
                textAlign: TextAlign.end,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Container(
              width: 60.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Text(
                tableItem.goalDifference.toString(),
                textAlign: TextAlign.end,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Container(
              width: 50.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Text(
                tableItem.point.toString(),
                textAlign: TextAlign.end,
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
