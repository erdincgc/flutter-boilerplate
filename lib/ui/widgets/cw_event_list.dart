import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uteamone/models/event.dart';

class CwEventList extends StatelessWidget {
  List events;

  CwEventList(this.events);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext content, int index) {
          Event event = sampleEvents[index];
          return EventListTile(event);
        });
  }
}

class EventListTile extends ListTile {
  EventListTile(Event event)
      : super(
    title: Text(event.name),
    subtitle: Text("Event Description : " + event.description  + " - Location : xxx "),
    leading: CircleAvatar(child: Text(event.name[0])),
  );
}
