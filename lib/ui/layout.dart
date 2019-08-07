import 'package:flutter/foundation.dart';

enum LayoutGroups {
  mapView,
  listView,
}

abstract class HasLayoutGroups {
  LayoutGroups get screenLayout;
  VoidCallback get onScreenLayoutToggle;
}

enum Screens {
  home,
  event,
  screen3,
  screen4,
  profile,
}

String getScreenName(Screens screen) {
  switch (screen) {
    case Screens.home:
      return 'Home';
    case Screens.event:
      return 'Event';
    case Screens.screen3:
      return 'Screen 3';
    case Screens.screen4:
      return 'Screen 4';
    case Screens.profile:
      return 'Profile';
    default:
      return '';
  }
}