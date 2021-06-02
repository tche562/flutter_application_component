import 'package:flutter/material.dart';
import 'package:flutter_application_component/config/theme.dart';
import 'table.dart';
import '../constant.dart';

class Gamepageheader extends StatelessWidget {
  // const Gamepageheader({Key? key}) : super(key: key);

  final dynamic eastTable;
  final dynamic westTable;
  Gamepageheader({this.eastTable, this.westTable});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConfTable(
            json: eastTable,
            teamIds: eastID,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConfTable(
            json: westTable,
            teamIds: westID,
          ),
        )
      ],
    );
  }
}
