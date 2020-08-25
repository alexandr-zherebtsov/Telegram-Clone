import 'package:flutgram/models/person_model.dart';
import 'package:flutgram/resources/colors.dart';
import 'package:flutgram/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Choice> choices = const <Choice>[
  const Choice(title: 'Call', icon: Icons.call),
  const Choice(title: 'Search', icon: Icons.search),
  const Choice(title: 'Clear history', icon: Icons.clear),
  const Choice(title: 'Mute notification', icon: Icons.volume_off),
  const Choice(title: 'Delete Chat', icon: Icons.delete_outline),
];

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage('$iconTheme'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0x00FFFFFF),
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: mediumGray,
                backgroundImage: AssetImage(widget.user.imageUrl),
                radius: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 190,
                      child: Text(
                        widget.user.name,
                        style: TextStyle(
                          color: blackGray,
                          fontSize: 17,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    Text(
                      widget.user.lastSeen,
                      style: TextStyle(
                        color: mediumGray,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ],
          ),

          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: blackGray,
            ),
            onPressed: () => Navigator.pop(context),
            tooltip: 'Back',
          ),

          actions: <Widget>[
            PopupMenuButton<Choice>(
              tooltip: 'Menu',
              onSelected: (val) => onItemMenuPress(val, context),
              icon: Icon(
                Icons.more_vert, color: blackGray,
              ),
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                      value: choice,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            choice.icon,
                            color: mediumGray,
                          ),
                          Container(
                            width: 10.0,
                          ),
                          Text(
                            choice.title,
                            style: TextStyle(color: blackGray),
                          ),
                        ],
                      ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: DialogWidget(),
      ),
    );
  }

  void onItemMenuPress(Choice choice, BuildContext context) {

  }

}
