import 'package:flutgram/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutgram/models/person_model.dart';

bool expandMore = false;
double filterHeight = 0.0;
double rotateExpandMore = 0.0;

class ExpandMore extends StatelessWidget {

  final String iconData;
  final String title;
  final bool nowInThisDevice;
  final VoidCallback onTilePressed;

  const ExpandMore({
    Key key,
    this.iconData,
    this.title,
    this.onTilePressed,
    this.nowInThisDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: CircleAvatar(
        backgroundColor: Color(0xFF888888),
        backgroundImage: AssetImage(iconData),
        radius: 15,
        child: nowInThisDevice ? Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: whiteColor,
                ),
                child: Container(
                  margin: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: blackGray,
                  ),
                  child: Icon(
                    Icons.check,
                    color: whiteColor,
                    size: 10,
                  ),
                ),
              ),
            )
          ],
        ) : Container(),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class DrawerRow extends StatelessWidget {

  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerRow({
    Key key,
    this.iconData,
    this.title,
    this.onTilePressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {

    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: mediumGray,
        child: ListView(
            children: <Widget>[
              DrawerHeader(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  image: DecorationImage(
                    image: AssetImage('$iconTheme'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        opacityColor,
                        opacityColorNearly,
                        whiteGray,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: mediumGray,
                              backgroundImage: AssetImage('$iconPerson'),
                              radius: 35,
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: opacityColorSome,
                              ),
                              child: ClipOval(
                                child: Material(
                                  color: opacityColor,
                                  child: Transform.rotate(
                                    angle: 1.0,
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      icon: Icon(
                                        Icons.brightness_2,
                                        color: blackGray,
                                        size: 20,
                                      ),
                                      tooltip: 'Change theme',
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, right: 10, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '$namePerson',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: blackGray,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    '$numberPerson',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: blackGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ClipOval(
                              child: Material(
                                color: opacityColor,
                                child: Transform.rotate(
                                  angle: rotateExpandMore,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.expand_more,
                                      color: blackGray,
                                      size: 32,
                                    ),
                                    tooltip: expandMore ? 'Close' : 'Open',
                                    onPressed: () {
                                      setState(() {
                                        if (!expandMore) {
                                          expandMore = true;
                                          rotateExpandMore = 3.15;
                                        } else {
                                          expandMore = false;
                                          rotateExpandMore = 0.0;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              expandMore ? ExpandMore(
                iconData: '$iconPerson',
                title: '$namePerson',
                nowInThisDevice: inThisDevice,
                onTilePressed: () {},
              ) : Container(),
              expandMore ? DrawerRow(
                iconData: Icons.add,
                title: 'Add Account',
                onTilePressed: () {},
              ) : Container(),
              expandMore ? Divider() : Container(),

              DrawerRow(
                iconData: Icons.group,
                title: 'New Group',
                onTilePressed: () {},
              ),
              DrawerRow(
                iconData: Icons.lock,
                title: 'New Secret Chat',
                onTilePressed: () {},
              ),
              DrawerRow(
                iconData: Icons.tablet,
                title: 'New Channel',
                onTilePressed: () {},
              ),
              DrawerRow(
                iconData: Icons.person,
                title: 'Contacts',
                onTilePressed: () {},
              ),
              DrawerRow(
                iconData: Icons.call,
                title: 'Calls',
                onTilePressed: () {},
              ),
              DrawerRow(
                iconData: Icons.bookmark_border,
                title: 'Saved Messages',
                onTilePressed: () {},
              ),
              DrawerRow(
                iconData: Icons.settings,
                title: 'Setting',
                onTilePressed: () {},
              ),
              Divider(),
              DrawerRow(
                iconData: Icons.person_add,
                title: 'Invite Friends',
                onTilePressed: () {},
              ),
              DrawerRow(
                iconData: Icons.copyright,
                title: 'Telegram FAQ',
                onTilePressed: () {},
              ),

            ],
        ),
      ),
    );
  }
}
