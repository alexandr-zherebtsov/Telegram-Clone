import 'package:flutgram/models/messages_model.dart';
import 'package:flutgram/resources/colors.dart';
import 'package:flutgram/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class MessagesDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 80,
      color: whiteGray,
      height: 1,
    );
  }
}

class UserMessages extends StatelessWidget {

  final String userIcon;
  final bool userOnlineNow;
  final int userOutUnread;
  final String userName;
  final bool userMuted;
  final String userChatTime;
  final String userChatText;
  final bool userInUnread;
  final int userMessagesNumber;
  final userChatScreen;

  const UserMessages({
    Key key,
    this.userIcon,
    this.userOnlineNow,
    this.userOutUnread,
    this.userName,
    this.userMuted,
    this.userChatTime,
    this.userChatText,
    this.userInUnread,
    this.userMessagesNumber,
    this.userChatScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: mediumGray,
        backgroundImage: AssetImage(userIcon),
        radius: 25,
        child: userOnlineNow ? Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: 38,
              left: 38,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: whiteColor,
                ),
                child: Container(
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: blackGray,
                  ),
                ),
              ),
            ),
          ],
        ) : Container(),
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxWidth: userOutUnread == 2 || userOutUnread == 1 ?
                    MediaQuery.of(context).size.width - 184
                        : MediaQuery.of(context).size.width - 160,
                  ),
                  child: Text(
                    userName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: blackGray,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                userMuted ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    Icons.volume_off,
                    color: mediumGray,
                    size: 16,
                  ),
                ) : Container(),
              ],
            ),
          ),
          userOutUnread == 1 ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(
              Icons.done,
              color: mediumGray,
              size: 18,
            ),
          ) : userOutUnread == 2 ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(
              Icons.done_all,
              color: blackGray,
              size: 18,
            ),
          ) : Container(),
          Text(
            userChatTime,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: mediumGray,
              fontSize: 14,
            ),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                userChatText,
                style: TextStyle(
                  color: mediumGray,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
            userInUnread ? Container(
              padding: const EdgeInsets.all(4.0),
              constraints: BoxConstraints(
                minHeight: 24.0,
                minWidth: 24.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: userMuted ? mediumGray : blackGray,
              ),
              child: Text(
                '$userMessagesNumber',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ) : Container(),
          ],
        ),
      ),
      onTap: () =>
          Navigator.push(
            context, MaterialPageRoute(
            builder: (_) =>
                ChatScreen(
                  user: userChatScreen,
                ),
            ),
          ),
    );
  }
}

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView.separated(
            separatorBuilder: (context, index) => MessagesDivider(),
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return UserMessages(
                userIcon: chat.sender.imageUrl,
                userOnlineNow: chat.sender.onlineNow,
                userOutUnread: chat.outUnread,
                userName: chat.sender.name,
                userMuted: chat.muted,
                userChatTime: chat.time,
                userChatText: chat.text,
                userInUnread: chat.inUnread,
                userMessagesNumber: chat.messagesNumber,
                userChatScreen: chat.sender,
              ); //: Container();
            }),
      ),
    );
  }
}

class MessagesFromFolder1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView.separated(
            separatorBuilder: (context, index) {
              final Message chat = chats[index];
              return chat.sender.id == 1 || chat.sender.id == 3 || chat.sender.id == 6 || chat.sender.id == 7 ?
              MessagesDivider() : Container();
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return chat.sender.id == 1 || chat.sender.id == 3 || chat.sender.id == 6 || chat.sender.id == 7 ? UserMessages(
                userIcon: chat.sender.imageUrl,
                userOnlineNow: chat.sender.onlineNow,
                userOutUnread: chat.outUnread,
                userName: chat.sender.name,
                userMuted: chat.muted,
                userChatTime: chat.time,
                userChatText: chat.text,
                userInUnread: chat.inUnread,
                userMessagesNumber: chat.messagesNumber,
                userChatScreen: chat.sender,
              ) : Container();
            }),
      ),
    );
  }
}

class MessagesFromFolder2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView.separated(
            separatorBuilder: (context, index) {
              final Message chat = chats[index];
              return chat.sender.id == 2 || chat.sender.id == 3 || chat.sender.id == 4 ?
              MessagesDivider() : Container();
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return chat.sender.id == 2 || chat.sender.id == 3 || chat.sender.id == 4 ? UserMessages(
                userIcon: chat.sender.imageUrl,
                userOnlineNow: chat.sender.onlineNow,
                userOutUnread: chat.outUnread,
                userName: chat.sender.name,
                userMuted: chat.muted,
                userChatTime: chat.time,
                userChatText: chat.text,
                userInUnread: chat.inUnread,
                userMessagesNumber: chat.messagesNumber,
                userChatScreen: chat.sender,
              ) : Container();
            }),
      ),
    );
  }
}

class MessagesFromFolder3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView.separated(
            separatorBuilder: (context, index) {
              final Message chat = chats[index];
              return chat.sender.id == 7 || chat.sender.id == 10 ?
              MessagesDivider() : Container();
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return chat.sender.id == 7 || chat.sender.id == 10 ? UserMessages(
                userIcon: chat.sender.imageUrl,
                userOnlineNow: chat.sender.onlineNow,
                userOutUnread: chat.outUnread,
                userName: chat.sender.name,
                userMuted: chat.muted,
                userChatTime: chat.time,
                userChatText: chat.text,
                userInUnread: chat.inUnread,
                userMessagesNumber: chat.messagesNumber,
                userChatScreen: chat.sender,
              ) : Container();
            }),
      ),
    );
  }
}

class MessagesFromFolder4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView.separated(
            separatorBuilder: (context, index) {
              final Message chat = chats[index];
              return chat.sender.id == 8 || chat.sender.id == 9 ?
              MessagesDivider() : Container();
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return chat.sender.id == 8 || chat.sender.id == 9 ? UserMessages(
                userIcon: chat.sender.imageUrl,
                userOnlineNow: chat.sender.onlineNow,
                userOutUnread: chat.outUnread,
                userName: chat.sender.name,
                userMuted: chat.muted,
                userChatTime: chat.time,
                userChatText: chat.text,
                userInUnread: chat.inUnread,
                userMessagesNumber: chat.messagesNumber,
                userChatScreen: chat.sender,
              ) : Container();
            }),
      ),
    );
  }
}

class MessagesFromFolder5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView.separated(
            separatorBuilder: (context, index) {
              final Message chat = chats[index];
              return chat.sender.id == 5 || chat.sender.id == 4 || chat.sender.id == 3 ?
              MessagesDivider() : Container();
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return chat.sender.id == 5 || chat.sender.id == 4 || chat.sender.id == 3 ? UserMessages(
                userIcon: chat.sender.imageUrl,
                userOnlineNow: chat.sender.onlineNow,
                userOutUnread: chat.outUnread,
                userName: chat.sender.name,
                userMuted: chat.muted,
                userChatTime: chat.time,
                userChatText: chat.text,
                userInUnread: chat.inUnread,
                userMessagesNumber: chat.messagesNumber,
                userChatScreen: chat.sender,
              ) : Container();
            }),
      ),
    );
  }
}

class MessagesFromFolder6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView.separated(
            separatorBuilder: (context, index) {
              final Message chat = chats[index];
              return chat.sender.id == 2 || chat.sender.id == 4 || chat.sender.id == 5 || chat.sender.id == 11 ?
              MessagesDivider() : Container();
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return chat.sender.id == 2 || chat.sender.id == 4 || chat.sender.id == 5 || chat.sender.id == 11 ? UserMessages(
                userIcon: chat.sender.imageUrl,
                userOnlineNow: chat.sender.onlineNow,
                userOutUnread: chat.outUnread,
                userName: chat.sender.name,
                userMuted: chat.muted,
                userChatTime: chat.time,
                userChatText: chat.text,
                userInUnread: chat.inUnread,
                userMessagesNumber: chat.messagesNumber,
                userChatScreen: chat.sender,
              ) : Container();
            }),
      ),
    );
  }
}
