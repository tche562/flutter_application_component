import 'package:flutter/material.dart';
import '/model/game_details.dart';
import 'package:intl/intl.dart';

const kLogoRadius = 22.0;
const kCardRadius = 16.0;

class GameCard extends StatelessWidget {
  final GameDetails? details;
  final dynamic json;
  const GameCard({required this.details, this.json});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kCardRadius)),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMMd().format(
                    DateTime.tryParse(details!.gameTime) ?? DateTime.now()),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                DateFormat.Hm().format(
                    DateTime.tryParse(details!.gameTime) ?? DateTime.now()),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).accentColor),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              details!.homeTeamLogo,
              RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color:
                              details!.homeTeamPoints > details!.awayTeamPoints
                                  ? Theme.of(context).primaryColor
                                  : Colors.black),
                      text: details!.homeTeamPoints.toString(),
                      children: <TextSpan>[
                    TextSpan(
                        text: ' : ',
                        style: TextStyle(color: Colors.black.withAlpha(100))),
                    TextSpan(
                        text: details!.awayTeamPoints.toString(),
                        style: TextStyle(
                            color: details!.awayTeamPoints >
                                    details!.homeTeamPoints
                                ? Theme.of(context).primaryColor
                                : Colors.black)),
                  ])),
              details!.awayTeamLogo,
            ],
          )
        ],
      ),
    );
  }
}
