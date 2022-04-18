import 'package:flutter/material.dart';

import 'package:pavlok_challenge/Clock.dart';
import 'dart:math' as math;
import 'package:pavlok_challenge/GoalSelection.dart';
import 'package:pavlok_challenge/HomeProvider.dart';
import 'package:pavlok_challenge/ModalSheet.dart';
import 'package:provider/provider.dart';

import 'BedTime.dart';
//import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  int minutes = 0 ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/goal_selection',
      routes: {
        '/home': (context) =>  ChangeNotifierProvider<HomePage> (
          create: (context) => HomePage(),
          child: GoalSelection(title: '',),  ) ,

        '/bedtime': (context) => ChangeNotifierProvider<HomePage> (
          create: (context) => HomePage(),
          child: BedTime(title: '',),  ),

        '/goal_selection': (context) => ChangeNotifierProvider<HomePage> (
          create: (context) => HomePage(),
          child: GoalSelection(title: '',),  ),

        '/clock': (context) => ChangeNotifierProvider<HomePage> (
          create: (context) => HomePage(),
          child: Clock( onAngleChanged: (double angle) {
            //minutes = ((angle / (math.pi * 2)) * 100).toInt();
         },),  ),

        '/reminder': (context) => ChangeNotifierProvider<HomePage> (
          create: (context) => HomePage(),
          child: Modal_Sheet( ) ,  ),

      },
    );
  }
}


