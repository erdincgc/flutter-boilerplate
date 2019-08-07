import 'package:flutter/material.dart';
import 'package:uteamone/ui/layout.dart';

class MainAppBar extends AppBar {
  MainAppBar(
      {LayoutGroups screenLayout,
      Screens screen,
      PreferredSize bottom,
      onScreenLayoutToggle,
//      VoidCallback onUserLogout,
      BuildContext context})
      : super(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(getScreenName(screen)),
          elevation: 1.0,
          actions: [
            IconButton(
              icon: Icon(screenLayout == LayoutGroups.mapView
                  ? Icons.map
                  : Icons.list),
              onPressed: () {onScreenLayoutToggle("def");},
            ),
            IconButton(
                icon: Icon(screenLayout == LayoutGroups.mapView
                    ? Icons.person_outline
                    : Icons.person),
                onPressed: () {onScreenLayoutToggle();},
            ),
          ],
          bottom: bottom,
        );
}
