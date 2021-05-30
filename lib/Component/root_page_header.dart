import 'package:flutter/material.dart';
import 'package:flutter_application_component/config/theme.dart';

class RootPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/icons/home.png',
          height: 40,
          color: NBATheme.whiteLight,
        ),
        Expanded(
          child: Center(
            child: Text('Searchbar'),
          ),
        ),
        Image.asset(
          'assets/images/icons/Search.png',
          height: 20,
          color: NBATheme.whiteLight,
        ),
      ],
    );
  }
}
