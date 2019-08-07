import 'package:flutter/cupertino.dart';
import 'package:uteamone/models/user.dart';
import 'package:uteamone/ui/layout.dart';

class BlocMain extends ChangeNotifier {
  // use in onTap _history.add(index); like in
  //https://stackoverflow.com/questions/49681415/flutter-persistent-navigation-bar-with-named-routes
  List<int> navigationHistory = [0]; //to hold navigation history ....
  Screens screenSelection = Screens.home; // default screen for navbar tab
  User user = User(1, 'Erdinc', '1234', 'erdincgc');
  int bottomNavBarIndex = 0;

  Map<String, int> registry = {
    'net': 0,
    'gps': 0,
    'force_login': 0,
  };

  BlocMain() {
    user = User(2, 'ErdincX', '1234', 'erdincgcx');
//    user = null;
  }


  void onScreenSelected(Screens screen) {
    print("your are here onScreenSelected");
    screenSelection = screen;
    notifyListeners();
  }

  onSelectBottomNavBarTab(int value,BuildContext context) {
    print("here you are : onSelectBottomNavBarTab $value - $bottomNavBarIndex");
    if (bottomNavBarIndex != value) {
      switch (value) {
        case 0:
          bottomNavBarIndex = value;
          onScreenSelected(Screens.home);
          break;
        case 1:
          bottomNavBarIndex = value;
          onScreenSelected(Screens.event);
//          Navigator.of(context).pushNamed('/');
          break;
        case 2:
          bottomNavBarIndex = value;
          onScreenSelected(Screens.screen3);
          break;
        case 3:
          bottomNavBarIndex = value;
          onScreenSelected(Screens.screen4);
          break;
        case 4:
          bottomNavBarIndex = value;
          onScreenSelected(Screens.profile);
          break;
      }
    }
//    notifyListeners();
  }

/*
  @override
  void onDisplayEventDetail(Event event) {
    // TODO: implement onDisplayEventDetail
  }

  @override
  void onDisplayEventList(UserTest user) {
    // TODO: implement onDisplayEventList
  }

  @override
  void onErrorEventDetail(Event event) {
    // TODO: implement onErrorEventDetail
  }

  @override
  void onErrorEventList(UserTest user) {
    // TODO: implement onErrorEventList
  }
*/

}
