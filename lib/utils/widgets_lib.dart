import 'package:flutter/material.dart';

import '../router.dart';

// this is the bottom left widget on the home screen
// when pressed it goes to the navigation router page and navigates to chat page

Widget factBot(BuildContext context) {
  return Container(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        child: Center(
          child: Icon(Icons.chat),
        ),
        elevation: 4.0,
        backgroundColor: Colors.blueAccent,
        onPressed: () => Navigator.pushNamed(context, FACTS_DIALOGFLOW),
      )
  );
}