import 'package:flutter/material.dart';
import 'home.dart';
import 'widgets/dialog_flow.dart';

const String FACTS_DIALOGFLOW = "FACTS_DIALOGFLOW"; // what we pass in if we click the chat icon

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch(routeSettings.name) { // "routeSettings.name" is what we pass in

    case '/': // default on route '/' it opens the home page
      return MaterialPageRoute(builder: (context) => MyHomePage());
      break;

    case FACTS_DIALOGFLOW: // if this is passed you return the page of (FlutterFactsDialogFlow())
      return MaterialPageRoute(builder: (context) => FlutterFactsDialogFlow());
      break;

    default: // default on route '/' it opens the home page
      return MaterialPageRoute(builder: (context) => MyHomePage());
  }
}