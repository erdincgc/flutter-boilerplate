import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteamone/bloc/global.dart';
import 'package:uteamone/models/user.dart';
import 'package:uteamone/models/event.dart';
import 'package:uteamone/ui/widgets/cw_event_list.dart';

class EventListingScreen extends StatefulWidget{
  EventListingScreen({Key key, dynamic data}) : super (key: key);

  @override
  State<StatefulWidget> createState () => EventListingScreenState();
}

class EventListingScreenState extends State<EventListingScreen> {
  BlocMain blocMain;
  EventList eventList = new EventList();

  Widget _buildScreenList(int index, Color color) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: CwEventList(eventList.getEventListByUser(blocMain.user)),
    );
  }

  Widget _buildScreenDetail(int index, Color color) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        '$index' + " as page 1",
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    );
  }

  Widget build(BuildContext context) {

    blocMain = Provider.of<BlocMain>(context);
//    this.eventListObject = EventList();
//    eventList = eventListObject.getEventListByUser(blocMain.user);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Event List"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body:
      PageView(
        children: [
          _buildScreenList(1, Colors.white),
          _buildScreenDetail(2, Colors.deepOrangeAccent),
        ],
      ),
    );
  }

}
