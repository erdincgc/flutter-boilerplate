import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteamone/bloc/global.dart';
import 'package:uteamone/ui/layout.dart';

class CwBottomNavBar extends StatelessWidget {
  BlocMain blocMain;
  Screens initialScreen = Screens.home;
  final int currentIndex;

  CwBottomNavBar({this.currentIndex});

  BottomNavigationBarItem _buildItem({IconData icon, Screens screenSelection, bool isSelected}) {
    String screenText = getScreenName(screenSelection);
    print("$screenText is selected : "+isSelected.toString());
    var iconColor = isSelected
        ? Colors.deepOrange
        : Colors.blueGrey;
    return BottomNavigationBarItem(
      title: Text(screenText,
          style: TextStyle(
            color: iconColor,
          )),
      icon: Icon(icon, color: iconColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    blocMain = Provider.of<BlocMain>(context);
    print("currentIndex $currentIndex ");
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.view_headline, screenSelection: Screens.home,isSelected: currentIndex==0),
        _buildItem(icon: Icons.format_size, screenSelection: Screens.event,isSelected: currentIndex==1),
        _buildItem(icon: Icons.layers, screenSelection: Screens.screen3,isSelected: currentIndex==2),
        _buildItem(icon: Icons.line_weight, screenSelection: Screens.screen4,isSelected: currentIndex==3),
        _buildItem(
            icon: Icons.format_line_spacing, screenSelection: Screens.profile,isSelected: currentIndex==4),
      ],
      // yada
      // items: _navigationViews.map((navigationView) => navigationView.item).toList(),
      currentIndex: currentIndex,
      onTap: (newIndex) =>  blocMain.onSelectBottomNavBarTab(newIndex, context),
//      onTap: (int value) blocMain.onSelectBottomNavBarTab(2, context),
    );
  }
}
