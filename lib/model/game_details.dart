import 'package:flutter/cupertino.dart';

class GameDetails {
  final Image homeTeamLogo;
  final int homeTeamPoints;
  final Image awayTeamLogo;
  final int awayTeamPoints;
  final String gameTime;

  GameDetails(
      {required this.homeTeamLogo,
      required this.homeTeamPoints,
      required this.awayTeamLogo,
      required this.awayTeamPoints,
      required this.gameTime});
}
