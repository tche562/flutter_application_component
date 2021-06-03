import 'package:flutter/material.dart';
import '/json/jsons.dart';
import '/http/network.dart';
import '/http/urls.dart';
import 'package:provider/provider.dart';
import '/component/connection.dart';
import 'package:flutter_application_component/Component/game_page_header.dart';

class WestPage extends StatefulWidget {
  const WestPage({Key? key}) : super(key: key);

  @override
  _WestPageState createState() => _WestPageState();
}

class _WestPageState extends State<WestPage> {
  final String _conferencename = 'west';
  Future<bool> getFile() async {
    bool complete = false;
    try {
      var westJson = await Network.getJson(Urls.westStandingsUrl);
      Provider.of<JsonFiles>(context, listen: false).setWestStandings(westJson);
      for (int idx = 0; idx < 15; idx++) {
        Provider.of<JsonFiles>(context, listen: false)
            .setWestIdIndex(westJson["api"]["standings"][idx]["teamId"], idx);
      }
      if ((Provider.of<JsonFiles>(context, listen: false).getWestStandings() !=
          null)) {
        complete = true; // data gotten
      }
    } catch (e) {
      print(e);
    }
    return complete;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ((Provider.of<JsonFiles>(context, listen: false)
                  .getWestStandings()) ==
              null)
          ? FutureBuilder(
              future: getFile(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Widget table;
                if (snapshot.data == true) {
                  table = Gamepageheader(
                      ConferenceTable:
                          Provider.of<JsonFiles>(context).getWestStandings(),
                      Conferencename: _conferencename);
                } else if (snapshot.data == false) {
                  table = NoConnection();
                } else {
                  table = Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return table;
              },
            )
          : Gamepageheader(
              ConferenceTable:
                  Provider.of<JsonFiles>(context).getWestStandings(),
              Conferencename: _conferencename),
    );
  }
}
