import 'package:flutter/material.dart';

class ConfTable extends StatefulWidget {
  final dynamic json;
  final Map? teamIds;
  ConfTable({this.json, this.teamIds});
  @override
  _ConfTableState createState() => _ConfTableState();
}

class _ConfTableState extends State<ConfTable> {
  List<DataRow> tableData() {
    List<DataRow> table = List.generate(
        15, (_) => DataRow(cells: [])); // fixed table length of 15 teams
    for (int index = 0; index < widget.teamIds!.length; index++) {
      String rank =
          widget.json["api"]["standings"][index]["conference"]["rank"];
      int pos = int.parse(rank) - 1; // position to insert data
      table[pos] = DataRow(
        cells: [
          // DataCell(
          //   Text(
          //     "$rank ${widget.teamIds![widget.json["api"]["standings"][index]["teamId"]][1]}",
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
          DataCell(
            Row(
              children: [
                Text(
                  "$rank ${widget.teamIds![widget.json["api"]["standings"][index]["teamId"]][1]}  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Image.asset(
                  'assets/images/team/${widget.teamIds![widget.json["api"]["standings"][index]["teamId"]][1]}.png',
                  width: 28,
                  height: 28,
                  // fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          DataCell(
            Text("${widget.json["api"]["standings"][index]["win"]}"), //
          ),
          DataCell(
            Text("${widget.json["api"]["standings"][index]["loss"]}"),
          ),
          DataCell(
            Text("${widget.json["api"]["standings"][index]["winPercentage"]}"),
          ),
        ],
      );
    }
    return table;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            'Team',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'W',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'L',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Pct',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
      rows: tableData(),
    );
  }
}
