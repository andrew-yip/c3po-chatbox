//Note: This needs to be changed to flutter package for Native apps
import 'package:flutter/material.dart';
import 'package:andrewyip_dialogflowdemo/utils/themes.dart';
import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbox Application',
      theme: MyAppThemes.AppThemeBlue(context), // theme of the material app file

      // onGenerateRoute method within material app
      onGenerateRoute: router.generateRoute, // determines the initial route
      initialRoute: '/', // initially opens the home page
    );
  }
}
