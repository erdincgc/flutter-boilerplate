import 'package:flutter/material.dart';

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text(
      "Error appeared.",
      style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
    ),
  );
}