import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteamone/ui/event/event_detail.dart';
import 'package:uteamone/ui/widgets/cw_bottom_nav_bar.dart';
import 'package:uteamone/ui/layout.dart';
import 'package:uteamone/ui/home/home.dart';
import 'package:uteamone/ui/event/events_listing.dart';
import 'package:uteamone/bloc/global.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreen({Key key}) : super(key: key);

  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  BlocMain blocMain;
  Screens screenSelection = Screens.home;
  int currentIndex = 0;

  Widget _buildBody() {
    switch (screenSelection) {
      case Screens.home:
        return HomeScreen(/*onUserLogout: _onUserLogout*/);
        break;
      case Screens.event:
        return Scaffold(
            appBar: AppBar(
              title: const Text('Screen 2'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Text('Screen 2 here', style: TextStyle(color: Colors.black)));
        break;
      case Screens.screen3:
        return Scaffold(
            appBar: AppBar(
              title: const Text('Screen 3'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Text('Screen 3 here', style: TextStyle(color: Colors.black)));
        break;
      case Screens.screen4:
        return Scaffold(
            appBar: AppBar(
              title: const Text('Screen 4'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Text('Screen 4 here', style: TextStyle(color: Colors.black)));
        break;
      case Screens.profile:
        return Scaffold(
            appBar: AppBar(
              title: const Text('Member Profile'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Text('Member profile details',
                style: TextStyle(color: Colors.black)));
        break;
    }
    throw new Exception("Unexpected screen error !");
  }

  void updateBottomNavBarIndex(int value) {
    setState(() {
      currentIndex = value;
    });

//    _pageController.animateToPage(page,
//        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  onSelectBottomNavBarTab(int value, BuildContext context) {
    if (currentIndex != value) {
      print("onSelectBottomNavBarTab $value - " + currentIndex.toString());
      updateBottomNavBarIndex(value);
      switch (value) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
          screenSelection = Screens.values[value];
          break;
      }
    }
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(
              icon: Icons.view_headline,
              screenSelection: Screens.home,
              isSelected: currentIndex == 0),
          _buildItem(
              icon: Icons.format_size,
              screenSelection: Screens.event,
              isSelected: currentIndex == 1),
          _buildItem(
              icon: Icons.layers,
              screenSelection: Screens.screen3,
              isSelected: currentIndex == 2),
          _buildItem(
              icon: Icons.line_weight,
              screenSelection: Screens.screen4,
              isSelected: currentIndex == 3),
          _buildItem(
              icon: Icons.format_line_spacing,
              screenSelection: Screens.profile,
              isSelected: currentIndex == 4),
        ],
        // yada
        // items: _navigationViews.map((navigationView) => navigationView.item).toList(),
        currentIndex: currentIndex,
        onTap: (newIndex) => onSelectBottomNavBarTab(newIndex, context),
      ),
    );
  }
}

BottomNavigationBarItem _buildItem(
    {IconData icon, Screens screenSelection, bool isSelected}) {
  String screenText = getScreenName(screenSelection);
  print("$screenText is selected : " + isSelected.toString());
  var iconColor = isSelected ? Colors.deepOrange : Colors.blueGrey;
  return BottomNavigationBarItem(
    title: Text(screenText,
        style: TextStyle(
          color: iconColor,
        )),
    icon: Icon(icon, color: iconColor),
  );
}
