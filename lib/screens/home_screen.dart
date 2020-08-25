import 'package:flutgram/resources/colors.dart';
import 'package:flutgram/resources/styles.dart';
import 'package:flutgram/widgets/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutgram/widgets/sidebar.dart';
import 'package:flutgram/models/person_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: foldersNames.length,
        child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            title: const Text('Telegram', style: topMenuTextColor),

            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search, color: blackGray,
                ),
                tooltip: 'Search',
                onPressed: () {},
              ),
            ],

            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: blackGray,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: 'Menu',
                );
              },
            ),

            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: mediumGray,
              indicatorColor: blackGray,
              labelColor: blackGray,

              tabs: foldersNames.map((FoldersNames foldersNames) {
                return Tab(
                  text: foldersNames.title,
                );
              }).toList(),
            ),
          ),

          drawer: Drawer(
            child: SideBar(),
          ),

          body: ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: mediumGray,
              child: TabBarView(
                children: [
                  Messages(),
                  MessagesFromFolder1(),
                  MessagesFromFolder2(),
                  MessagesFromFolder3(),
                  MessagesFromFolder4(),
                  MessagesFromFolder5(),
                  MessagesFromFolder6(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}