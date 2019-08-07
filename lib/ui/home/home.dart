//import 'dart:ui';
import 'dart:async';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uteamone/models/event.dart';
import 'package:uteamone/models/user.dart';
import 'package:uteamone/ui/layout.dart';
import 'package:uteamone/ui/widgets/cw_event_list.dart';
import 'package:uteamone/ui/widgets/cw_main_app_bar.dart';
import 'package:uteamone/ui/widgets/cw_bottom_nav_bar.dart';
//import 'package:uteamone/screens/home/home_screen_presenter.dart';

/**
 * The HomeScreen class manages its own state, so it overrides createState() to create a State object.
 * The framework calls createState() when it wants to build the widget.
 * In this example, createState() returns an instance of HomeScreenState, which you’ll implement below
 */

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key/*, this.screenLayout, this.onScreenLayoutToggle, this.onUserLogout*/})
      : super(key: key);
  LayoutGroups screenLayout= LayoutGroups.listView;
  @override
  State<StatefulWidget> createState() => HomeScreenState();

//  and usage below in documentation is also true.... learn the difference
//  HomeScreenState  createState() => HomeScreenState();

// or long  syntax below
/*
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
  */
}

/**
 * The HomeScreenState class stores the mutable data that can change over the lifetime of the widget.
 * When the app first launches, the UI displays widgets with values and shape as defined.
 * These values are stored in the _text1 and _presenter for instance:
 * The class also defines the build() method
 * Note 1 : Use IconButton (instead of Icon) because it has an onPressed property that defines the callback function (_toggleFavorite) for handling a tap.
 * You’ll define the callback function next.
 * Note 2 : Placing the Text in a SizedBox and setting its width prevents a discernible “jump” when the text changes between the values of 40 and 41 —
 * a jump would otherwise occur because those values have different widths.
 * Note 3 : For instance, the onScreenLayoutToggle() method, which is called when the MainAppBar is tapped, calls setState().
 * Calling setState() is critical, because this tells the framework that the widget’s state has changed and that the widget should be redraw
 */
class HomeScreenState extends State<HomeScreen> /* implements HasLayoutGroupsimplements HomeScreenContract */ {
  //HomeScreenPresenter _presenter;
  String _text1;
  EventList eventList = new EventList();


  HomeScreenState() {
    // _presenter = new HomeScreenPresenter(this);
//    _presenter.getUserInfo();
  }



  void onScreenLayoutToggle([optpar="abc"]) {
    print("onScreenLayoutToggle .... $optpar .... : ${widget.screenLayout}");
    setState(() {
      widget.screenLayout = widget.screenLayout == LayoutGroups.mapView ? LayoutGroups.listView : LayoutGroups.mapView;
    });
  }

  Widget _buildScreenList({int index, Color color}) {
    _text1 = "Event List";
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: CwEventList(eventList.getAll()),
    );
  }

  Widget _buildScreenMap({int index, Color color}) {
    _text1 = "Map View";
    return Container(
      alignment: AlignmentDirectional.center,
      color: Colors.deepOrangeAccent,
      child: Text(
         _text1.toString() + " at layout $index",
        style: TextStyle(fontSize: 24.0, color: Colors.white),
      ),
    );
  }

   @override
  build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          screenLayout:  widget.screenLayout,
          screen: Screens.home,
          bottom: null,
          onScreenLayoutToggle: onScreenLayoutToggle,
//          onUserLogout: widget.onUserLogout,
          context: context,
        ),
        body: Container(
            child:  widget.screenLayout == LayoutGroups.listView
                ? _buildScreenList(index: 1, color: Colors.white)
                : _buildScreenMap(index: 2, color: Colors.white)
        )
    );
  }
}
