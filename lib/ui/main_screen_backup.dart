import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteamone/ui/event/event_detail.dart';
import 'package:uteamone/ui/widgets/cw_bottom_nav_bar.dart';
import 'package:uteamone/ui/layout.dart';
import 'package:uteamone/ui/home/home.dart';
import 'package:uteamone/ui/event/events_listing.dart';
import 'package:uteamone/bloc/global.dart';

/*class MainScreen extends StatefulWidget {
  @override
  MainScreen({Key key}) : super(key: key);

  State<StatefulWidget> createState() {
    return new MainScreenState();
  }
}*/

class MainScreen extends StatelessWidget {
  BlocMain blocMain;

  Widget _buildBody() {
    switch (blocMain.screenSelection) {
      case Screens.home:
        return HomeScreen(
//          onUserLogout: _onUserLogout,
        );
      case Screens.event:
        return EventListingScreen();
      case Screens.screen3:
        return EventDetailScreen();
        /*return Scaffold(
            appBar: AppBar(
              title: const Text('Screen 3'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Text('Screen 3 here',
                style: TextStyle(color: Colors.black)));*/
      case Screens.screen4:
        return Scaffold(
            appBar: AppBar(
              title: const Text('Screen 4'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Text('Screen 4 here',
                style: TextStyle(color: Colors.black)));
      case Screens.profile:
        return Scaffold(
            appBar: AppBar(
              title: const Text('Member Profile'),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Text('Member profile details',
                style: TextStyle(color: Colors.black)));
    }
    return null;
  }

  @override
  build(BuildContext context) {
    blocMain = Provider.of<BlocMain>(context);
    return Scaffold(
        appBar: null,
        body: _buildBody(),
        bottomNavigationBar: CwBottomNavBar(currentIndex: blocMain.bottomNavBarIndex),
        );
  }
}
