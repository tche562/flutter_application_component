import 'package:flutter/material.dart';
import '/json/jsons.dart';
import '/http/network.dart';
import '/http/urls.dart';
import 'package:provider/provider.dart';
import '/component/connection.dart';
import 'package:flutter_application_component/Component/game_page_header.dart';

class EastPage extends StatefulWidget {
  const EastPage({Key? key}) : super(key: key);

  @override
  _EastPageState createState() => _EastPageState();
}

class _EastPageState extends State<EastPage> {
  final String _conferencename = 'east';
  Future<bool> getFile() async {
    bool complete = false;
    try {
      var eastJson = await Network.getJson(Urls.eastStandingsUrl);
      Provider.of<JsonFiles>(context, listen: false).setEastStandings(eastJson);
      for (int idx = 0; idx < 15; idx++) {
        Provider.of<JsonFiles>(context, listen: false)
            .setEastIdIndex(eastJson["api"]["standings"][idx]["teamId"], idx);
      }
      if ((Provider.of<JsonFiles>(context, listen: false).getEastStandings() !=
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
                  .getEastStandings()) ==
              null)
          ? FutureBuilder(
              future: getFile(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Widget table;
                if (snapshot.data == true) {
                  table = Gamepageheader(
                      ConferenceTable:
                          Provider.of<JsonFiles>(context).getEastStandings(),
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
                  Provider.of<JsonFiles>(context).getEastStandings(),
              Conferencename: _conferencename),
    );
  }
}
