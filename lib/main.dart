import 'package:flutter/material.dart';
import 'package:world_time/choose_location.dart';
import 'package:world_time/home.dart';
import 'package:world_time/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
