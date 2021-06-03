import 'package:flutter/material.dart';
import 'package:flutter_application_component/config/theme.dart';
import 'table.dart';
import '../constant.dart';

class Gamepageheader extends StatelessWidget {
  // const Gamepageheader({Key? key}) : super(key: key);

  final dynamic ConferenceTable;
  final String? Conferencename;
  // late final Map? teamIds;
  // final dynamic westTable;
  Gamepageheader({this.ConferenceTable, this.Conferencename});

  @override
  Widget build(BuildContext context) {
    return //TabBarView(
        //   children: [
        SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ConfTable(
        json: ConferenceTable,
        teamIds: (Conferencename == 'east') ? eastID : westID,
      ),
    );
    // SingleChildScrollView(
    //   scrollDirection: Axis.vertical,
    //   child: ConfTable(
    //     json: westTable,
    //     teamIds: westID,
    //   ),
    // )
    // ],
    // );
  }
}
