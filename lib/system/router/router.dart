import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteamone/models/user.dart';
import 'package:uteamone/ui/event/events_listing.dart';
import 'package:uteamone/ui/home/home.dart';
import 'package:uteamone/ui/main_screen.dart';
import 'package:uteamone/bloc/global.dart';

class RoutePaths {
  static const String root = '/';
  static const String home = '/home';
  static const String main = '/main';
  static const String event = '/event';
  static const String login = '/login';
}

class Router {
  static Route generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final BlocMain blocMain = BlocMain();
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<BlocMain>(
            builder: (context) => blocMain,
            child: MainScreen(),
          ),
        );
      case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/event':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => EventListingScreen(
              data: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class RouterWithoutProvider {
  static Route generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
       case '/home':
//        User user = settings.arguments;
//        return MaterialPageRoute(builder: (_) => LoginScreen(user: user));
         return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/event':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => EventListingScreen(
              data: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
