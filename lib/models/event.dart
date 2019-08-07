import 'user.dart';

List<Event> sampleEvents = [
  Event(1, 'Event 1', "[41,41]"),
  Event(2, 'Event 2', "[41,41]"),
  Event(3, 'Event 3', "[41,41]"),
  Event(4, 'Event 4', "[41,41]"),
  Event(5, 'Event 5', "[41,41]"),
  Event(6, 'Event 6', "[41,41]"),
  Event(7, 'Event 11', "[41,41]"),
  Event(8, 'Event 12', "[41,41}"),
  Event(9, 'Event 13', "[41,41]"),
  Event(10, 'Event 14', "[41,41]"),
  Event(11, 'Event 15', "[41,41]"),
  Event(12, 'Event 16', "[41,41]"),
];

class Event {
  int _id;
  String _name;
  String _description;
  String _location;
  String _ownerUsername;

  Event(this._id, this._name, this._description,
      [this._location, this._ownerUsername]);

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get location => _location;
  String get ownerUsername => _ownerUsername;

  Event.map(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._description = obj["description"];
    this._location = obj["location"];
    this._ownerUsername = obj["ownerUsername"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["location"] = _location;
    map["owner_username"] = _ownerUsername;
    return map;
  }

}

class EventList {
  List<Event> list = new List();
  List<Event> custom_list = new List();

  EventList(){
    list.addAll(sampleEvents);
//    for(int i=0;i<sampleEvents.length;i++){
//      list.add(sampleEvents[i]);
//    }
  }

  List<Event> getEventListByUser([User user]) {
    if(user != null) {
      custom_list.addAll([
        sampleEvents[2],
        sampleEvents[3],
        sampleEvents[4],
        sampleEvents[5]
      ]);
      return custom_list;
    } else {
      return list;
    }
  }

  List<Event> getAll() {
    return list;
  }

  Event getEventById(int eventId) {
    return sampleEvents[eventId];
  }

}
