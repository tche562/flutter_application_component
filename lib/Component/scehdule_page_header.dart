import 'package:flutter/material.dart';
import 'package:flutter_application_component/config/theme.dart';
import '/model/time.dart';
import '/model/game_details.dart';

import '../constant.dart';
import 'game_card.dart';

class SchedulePageHeader extends StatelessWidget {
  final dynamic jsonFile;
  SchedulePageHeader({this.jsonFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: jsonFile["api"]["results"],
        itemBuilder: (context, index) {
          dynamic json = jsonFile["api"]["games"][index];
          Map allTeams = {}; // combine all teams into single map
          allTeams.addAll(eastID);
          allTeams.addAll(westID);
          Widget card;
          // Check if Id is in allTeam and points aint empty
          if ((allTeams.containsKey(json["hTeam"]["teamId"]) &&
                  allTeams.containsKey(json["vTeam"]["teamId"])) &&
              ((json["hTeam"]["score"]["points"].toString().isNotEmpty))) {
            List<String> gameTime = timeString(json["startTimeUTC"]);

            card = Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GameCard(
                details: GameDetails(
                    homeTeamLogo: Image.asset(
                      'assets/images/team/${allTeams[json["hTeam"]["teamId"]][1]}.png',
                      width: 45,
                      height: 45,
                    ),
                    homeTeamPoints:
                        int.tryParse(json["hTeam"]["score"]["points"]) ?? 0,
                    awayTeamLogo: Image.asset(
                      'assets/images/team/${allTeams[json["vTeam"]["teamId"]][1]}.png',
                      width: 45,
                      height: 45,
                    ),
                    awayTeamPoints:
                        int.tryParse(json["vTeam"]["score"]["points"]) ?? 0,
                    gameTime: json["startTimeUTC"]),
              ),
            );
          } else {
            card = SizedBox(
              height: 0,
            );
          }
          return card;
        },
      ),
    );
  }
}
