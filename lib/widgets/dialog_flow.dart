import 'package:flutter/material.dart';
import 'fact_message.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class FlutterFactsDialogFlow extends StatefulWidget {
  FlutterFactsDialogFlow({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterFactsDialogFlowState createState() => new _FlutterFactsDialogFlowState();
}

class _FlutterFactsDialogFlowState extends State<FlutterFactsDialogFlow> {
  final List<FactsMessage> _messages = <FactsMessage>[]; // to hold all the messages
  final TextEditingController _textController = new TextEditingController();

  // text field in flutter (needs a text controller)
  Widget _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController, // the text field
                onSubmitted: _submitQuery, // text is passed implisitly
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container( // for the send button
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send), // when you press the send button
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _dialogFlowResponse(query) async {
    _textController.clear(); // clears the text field
    AuthGoogle authGoogle = // does authentication
    await AuthGoogle(fileJson: "lib/assets/upbeat-grammar-295706-1120da60be87.json").build();
    Dialogflow dialogFlow =
    Dialogflow(authGoogle: authGoogle, language: Language.english); //what you want response in
    AIResponse response = await dialogFlow.detectIntent(query); // gets text from api
    FactsMessage message = FactsMessage( // constructs fact message
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title, // gets the text and passes it
      name: "C3PO", // name of bot
      type: false, // not me
    );
    setState(() {
      _messages.insert(0, message); // inserts to queue
    });
  }

  void _submitQuery(String text) {
    _textController.clear(); // first clears text input box
    FactsMessage message = new FactsMessage( // then creates a message
      text: text, // passing the text
      name: "You: ", // the user me
      type: true, // true because im human
    );
    setState(() {
      _messages.insert(0, message); // update message queue (updating dynamically)
    });
    _dialogFlowResponse(text); // then send message to dialog flow
  }

  // actual part where you build the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("conversation with c3po"),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _queryInputWidget(context),
        ),
      ]),
    );
  }
}