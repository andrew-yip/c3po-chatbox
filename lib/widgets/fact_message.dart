import 'package:flutter/material.dart';

class FactsMessage extends StatelessWidget {
  FactsMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type; // if user or bot to determine left or right align of screen

  // two types of messages (either bot or user)
  // list of widgets side by side

  // bot messages
  List<Widget> botMessage(context) {
    return <Widget>[ // this widget that we're returning is side by side
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        //child: CircleAvatar(child: Text('Bot')),
        child: CircleAvatar(child: new Image(image: AssetImage('lib/assets/c3po.png'))),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 'start' means aligned at left of screen
          children: <Widget>[
            Text(this.name,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text), // 'text' is the dialog flow api, one child
            ),
          ],
        ),
      ),
    ];
  }

  // user messages
  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // 'end' means starts at right of screen
          children: <Widget>[
            Text(this.name, style: Theme.of(context).textTheme.subhead),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
       // child: CircleAvatar(child: new Text(this.name[0])),
        child: CircleAvatar(child: new Image(image: AssetImage('lib/assets/me.png'))),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}
