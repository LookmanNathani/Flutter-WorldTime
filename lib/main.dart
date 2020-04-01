import 'package:check/pages/loading.dart';
import 'package:check/pages/location.dart';
import 'package:flutter/material.dart';
import 'package:check/pages/home.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/Home': (context) => Home(),
      '/Location': (context) => Location(),
    },
  ));
}