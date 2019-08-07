import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uteamone/system/router/router.dart';
import 'package:provider/provider.dart';
import 'package:uteamone/system/provider_setup.dart';
import 'package:uteamone/bloc/global.dart';
import 'package:uteamone/system/helpers/exceptions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return getErrorWidget(context, errorDetails);
    };

    return MaterialApp(
      title: 'UTeam App 1',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: Colors.orange,
        scaffoldBackgroundColor: Colors.orange,
        accentColor: const Color(0xFFFFAD32),
      ),
      builder: (BuildContext context, Widget widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return getErrorWidget(context, errorDetails);
        };

        return widget;
      },
      initialRoute: RoutePaths.root,
      onGenerateRoute:  Router.generateRoute,
//        debugShowCheckedModeBanner: false,
      //platform: Theme.of(context).platform,
    );
  }
}

