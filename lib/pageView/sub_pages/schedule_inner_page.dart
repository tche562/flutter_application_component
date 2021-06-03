import 'package:flutter/material.dart';
import 'package:flutter_application_component/Component/scehdule_page_header.dart';
import '/json/jsons.dart';
import '/http/network.dart';
import '/http/urls.dart';
import 'package:provider/provider.dart';
import '/component/connection.dart';

class ScheduleInnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<JsonFiles>(context, listen: false).getGames() == null
        ? FutureBuilder(
            future: Network.getJson(Urls.seasonGames),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                Provider.of<JsonFiles>(context, listen: false)
                    .setGames(snapshot.data);
                dynamic json = snapshot.data;
                return SchedulePageHeader(
                  jsonFile: json,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 50,
                      ),
                      Text("An error occured!"),
                    ],
                  ),
                );
              } else if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
                // return NoConnection();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        : SchedulePageHeader(
            jsonFile: Provider.of<JsonFiles>(context).getGames(),
          );
  }
}
