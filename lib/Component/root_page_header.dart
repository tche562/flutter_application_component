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
            child: _searchBar(),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            size: 25,
            color: NBATheme.whiteLight,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 30,
      width: 280,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: NBATheme.NBAbluelight,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(
              '   Search for NBA info',
              style: TextStyle(
                fontSize: 12,
                color: NBATheme.whiteDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
