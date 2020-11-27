import 'package:andrewyip_dialogflowdemo/widgets/emailBox.dart';
import 'package:flutter/material.dart';
import 'package:andrewyip_dialogflowdemo/utils/strings.dart';
import 'package:andrewyip_dialogflowdemo/utils/myColors.dart';
import '../router.dart';
import 'package:andrewyip_dialogflowdemo/utils/widgets_lib.dart';
import 'package:url_launcher/url_launcher.dart';


class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  Strings.hello,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: MyColors.blue4,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: Strings.welcomeTo,
                      style: TextStyle(fontSize: 40, color: MyColors.blue4),
                      children: [
                        TextSpan(
                            text: Strings.ftf,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54))
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    Strings.backgroundImage,
                    scale: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 20),
                  child: Text(Strings.contact),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: RaisedButton(color: Colors.blue,
                    onPressed: () async{
                      const url = 'https://www.andrewayip.com';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text('checkout my website', style: TextStyle(fontSize: 22),),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('click the chat icon below to start chatting with c3po'),
                ),
                // EmailBox(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: factBot(context),
          ),
        ],
      ),
    );
  }
}
