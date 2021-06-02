import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Network {
  /*
   * Class is responsible for sending our get request to the NBA-API
   * each method of the class sends a get request for a particular data-endpoint for properties of the app
   * 1. get latest standings for bothe Eastern and Western Conference
   * 2. get scores of NBA games played
   * 3. get player statics such as ppg, apg, rpg, FG%, 
   */

  // here is a new problem: the new version of http api have a new defination of url. It cannot be
  //just a string any more. I plan to leave this problem here and keep use the old version to skip this problem.

  // make request to get Json file
  static Future<dynamic> getJson(String url) async {
    // make request to get Json file
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var json = convert.jsonDecode(response.body);
          return json;
        }
      }
    } catch (e) {
      //TODO: Handle this exception
      print(e);
    }
  }

  static Future<void> launchSite(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
