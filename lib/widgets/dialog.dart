import 'package:flutgram/models/dialog_model.dart';
import 'package:flutgram/models/person_model.dart';
import 'package:flutgram/resources/colors.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.up,
              color: mediumGray,
              child: ClipRRect(
                child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    itemCount: dialog.length,
                    itemBuilder: (BuildContext context, int index) {
                      final thisDialog = dialog[index];
                      return Padding(
                        padding: index == dialog.length - 1
                            ? const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0)
                            : const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: thisDialog.sender == currentUser ? Alignment.topRight : Alignment.topLeft,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width - 60,
                                ),
                                padding: const EdgeInsets.all(6.0),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  color: whiteOpacity,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      thisDialog.text,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: blackGray,
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      margin: const EdgeInsets.only(top: 2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            thisDialog.time,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: mediumGray,
                                            ),
                                          ),
                                          thisDialog.sender == currentUser ? Padding(
                                            padding: const EdgeInsets.only(left: 4),
                                            child: thisDialog.unread ? Icon(
                                              Icons.done,
                                              color: mediumGray,
                                              size: 15,
                                            ) : Icon(
                                              Icons.done_all,
                                              color: mediumGray,
                                              size: 15,
                                            ),
                                          ) : Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                }),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          color: whiteColor,
          child: Row(
            children: <Widget>[
              ClipOval(
                child: Material(
                  color: opacityColor,
                  child: IconButton(
                    icon: Icon(Icons.insert_emoticon),
                    iconSize: 25.0,
                    color: blackGray,
                    onPressed: () {},
                    tooltip: 'Emoji',
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) {},
                  cursorColor: blackGray,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Send a message...',
                    hintStyle: TextStyle(color: mediumGray),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: opacityColor,
                  child: Transform.rotate(
                    angle: 2.3,
                    child: IconButton(
                      icon: Icon(Icons.attachment),
                      iconSize: 25.0,
                      color: blackGray,
                      onPressed: () {},
                      tooltip: 'Attach',
                    ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: opacityColor,
                  child: IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 25.0,
                    color: blackGray,
                    onPressed: () {},
                    tooltip: 'Send',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
