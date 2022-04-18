import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pavlok_challenge/Good_Bad_habits_api.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'HomeProvider.dart';

class GoalSelection extends StatefulWidget {
  GoalSelection({Key? key,  required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _GoalSelectionState createState() => _GoalSelectionState();
}

class _GoalSelectionState extends State<GoalSelection> {

  HomePage color_updater = new HomePage();

  Color? color_grey = Colors.grey[500];
  double step = 1;
  int caller = 10 ;

  void navigateToTimer(){
      Navigator.pushReplacementNamed(context, '/bedtime' );
   // Navigator.pop(context );

  }

      void changelist(int value) {
        color_updater.changeListview(value);
       // color_updater.changeListview2(value);
      }

      void  change_appearance (int value) {
        color_updater.change_appearance (value);

      }

      void pressed_button(){
        color_updater.pressed_button (true);
      }


 /* @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }*/


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          //color set to transperent or set your own color
          statusBarIconBrightness: Brightness.dark,

          //set brightness for icons, like dark background light icons
        )
    );

    Widget detector ;

    color_updater  = Provider.of<HomePage>( context  );

    List<Good_Bad_habits_api> options_good_habits = [
      Good_Bad_habits_api(habit: 'Set bedtime and wake up', url: 'cantwake.svg' ),
      Good_Bad_habits_api(habit: 'Take a walk', url: 'walk.svg' ),
      Good_Bad_habits_api(habit: 'Stay hydrated', url: 'water.svg' ),
      Good_Bad_habits_api(habit: 'Call parents', url: 'call.svg' ),
      Good_Bad_habits_api(habit: 'Donate to charity', url: 'donate.svg' ),

    ] ;

    List<Good_Bad_habits_api> options_bad_habits = [

      Good_Bad_habits_api(habit: 'Can\'t wake up', url: 'cantwake.svg' ),
      Good_Bad_habits_api(habit: 'Getting lazy for workout', url: 'walk.svg' ),
      Good_Bad_habits_api(habit: 'Forgetting to drink water', url: 'water.svg' ),
      Good_Bad_habits_api(habit: 'Spending on credit cards', url: 'donate.svg' ),

    ] ;

    return Scaffold(


      backgroundColor: Color.fromRGBO(252, 251, 255, 1),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        // color: Color.fromRGBO(252, 251, 255, 1),
      //  child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),

                    child: Row (

                      mainAxisAlignment: MainAxisAlignment.center,

                      children:<Widget> [

                        Expanded(
                          flex: 1,
                          child: Container(
                           // width: MediaQuery.of(context).size.width/5,
                            child: Text(
                              '',
                              style: TextStyle(
                                color: color_grey ,
                                fontSize: 15.0,
                                letterSpacing: 1.0,
                                // fontWeight: FontWeight.bold,
                              ),


                            ),
                          ),
                        ),

                      Expanded(
                        flex: 2,
                        child: Container(
                         // width: MediaQuery.of(context).size.width *3/5,

                            child: Wrap(

                                direction : Axis.horizontal,
                                alignment : WrapAlignment.center,
                                spacing : 20,
                                // runAlignment = WrapAlignment.start,
                                //  double runSpacing = 0.0,
                                crossAxisAlignment : WrapCrossAlignment.center,

                                //   verticalDirection : VerticalDirection.down,
                                clipBehavior : Clip.none,
                                children :  <Widget>[
                                  LinearPercentIndicator(
                                    lineHeight: 7,
                                   // width: MediaQuery.of(context).size.width /2 ,
                                    percent: 25/100 ,
                                   // fillColor: Color.fromRGBO(233, 233, 233, 1),
                                    backgroundColor: Color(0xFFE9E9E9) ,
                                    progressColor: Color(0xFFFFB706) ,
                                    animation: true,
                                    animationDuration: 2000,


                                  ),
                              ]
                            ),



                        ),
                      ),
                       Expanded(
                         flex: 1,
                         child: Container(
                           //width: MediaQuery.of(context).size.width/4,
                           child: Wrap(
                             direction : Axis.horizontal,
                             alignment : WrapAlignment.center,
                             spacing : 20,
                             // runAlignment = WrapAlignment.start,
                             //  double runSpacing = 0.0,
                             crossAxisAlignment : WrapCrossAlignment.center,

                             //   verticalDirection : VerticalDirection.down,
                             clipBehavior : Clip.none,
                             children :  <Widget>[
                              Text(
                               '1 of 4',
                               style: TextStyle(
                                 color: Color(0xFF939295),
                                 fontSize: 16.0,
                                 letterSpacing: 1.0,
                                 fontFamily: 'Manrope-VariableFont_wght',
                                // fontWeight: FontWeight.bold,
                               ),


                             ),
                             ],
                           ),
                         ),
                       ),


                      ],
                    ),

                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    'What\'s your main goal?' ,
                    style: TextStyle(
                      color: Color(0xFF383E53),
                      fontSize: 20.0,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope-VariableFont_wght',
                    ),


                  ),
                ),


                Container(
                  margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  child: Text(
                    'Let\'s start with one of these habits.',
                    style: TextStyle(
                      color: Color(0xFF383E53) ,
                      fontSize: 14.0,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope-VariableFont_wght',
                    ),

                  ),
                ),

            Container(
              margin: EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 0.0) ,
              child:
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Consumer <HomePage> ( builder : (context, updater, child) =>
                      Container(
                        decoration: BoxDecoration (
                          border : Border (

                            bottom: BorderSide (
                              color: color_updater.visibility1 ,
                              width: 2,

                              //style: BorderStyle.
                            ),
                          ),

                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0.0) ,
                          child: InkWell(
                               //   customBorder:   ,
                                onTap:() {
                                  change_appearance (10);
                                  changelist(1);
                                },
                            splashColor: color_updater.button_unselected2 ,
                            hoverColor: color_updater.button_unselected2 ,
                              child:
                              Container(
                                height: 50 ,
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),


                                child:  Row (

                                  children:<Widget> [

                                  Wrap(
                                      direction : Axis.horizontal,

                                      alignment : WrapAlignment.start,
                                      spacing : 5,
                                       runAlignment : WrapAlignment.center,
                                      //  double runSpacing = 0.0,
                                      crossAxisAlignment : WrapCrossAlignment.center,
                                      //   verticalDirection : VerticalDirection.down,
                                      clipBehavior : Clip.none,
                                      children :  <Widget>[

                                         SvgPicture.asset('assets/leaf.svg', color: color_updater.visibility3,
                                            semanticsLabel: 'leaf',) ,

                                           Text('Start a good habit',
                                             style: TextStyle(
                                               color: color_updater.visibility3 ,
                                               fontSize: 14.0,
                                               letterSpacing: 0.2,
                                               fontWeight: FontWeight.bold,
                                               fontFamily: 'Manrope-VariableFont_wght',
                                             ),

                                         ),

                                      ]


                                       ),



                                  ] ),
                                 ),
                            ),
                        ),
                      ),
                    ),

                      Divider(
                        height: 0.0,
                        color: color_updater.button_selected,
                        thickness: 0.0,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Consumer <HomePage> ( builder : (context, updater, child) =>
                          Container(
                            decoration:
                            BoxDecoration (
                              border : Border (

                                bottom: BorderSide (
                                  color: color_updater.visibility2 ,
                                  width: 2,

                                  //style: BorderStyle.
                                ),
                              ),

                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0.0) ,
                              child: InkWell(
                              //   customBorder:   ,
                              onTap:() {
                                change_appearance (10);
                                changelist(2);
                              },
                              splashColor: color_updater.button_unselected2 ,
                              hoverColor: color_updater.button_unselected2 ,
                              child:
                              Container(
                                height: 50,
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),

                              child: Row (
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children:<Widget> [

                                    Wrap(
                                      // key: null,
                                       direction : Axis.horizontal,
                                       alignment : WrapAlignment.start,
                                       spacing : 5,
                                      // runAlignment = WrapAlignment.start,
                                    //  double runSpacing = 0.0,
                                      crossAxisAlignment : WrapCrossAlignment.center,

                                    //   verticalDirection : VerticalDirection.down,
                                       clipBehavior : Clip.none,
                                       children :  <Widget>[

                                     SvgPicture.asset('assets/break_icon.svg', color: color_updater.visibility4,
                                      semanticsLabel: 'break',) ,


                                         Text('Break a bad habit',
                                           style: TextStyle(
                                             color: color_updater.visibility4 ,
                                             fontSize: 14.0,
                                             letterSpacing: 0.2,
                                             //fontWeight: FontWeight.bold,
                                             fontFamily: 'Manrope-VariableFont_wght',
                                           ),
                                         )


                                       ],



                                    ),

                                  ] ),
                                ),

                        ),
                            ),
                          ),
                      ),

                      Divider(
                        height: 0.0,
                        color: color_updater.button_unselected,

                      ),
                    ],
                  ),

                ] ),
            ),


              //  Expanded(


              //   child:
                    Consumer <HomePage> ( builder : (context, updater, child) =>
                       Visibility(

                        visible: color_updater.visible1 ,
                        child: Container (
                          height:  MediaQuery.of(context).size.height*0.55,

                             child:    Consumer <HomePage> ( builder : (context, updater, child) =>
                                ListView.builder(
                                itemCount: options_good_habits.length,
                                itemBuilder: (context, index){

                               return GestureDetector(
                                 onTap: (){
                                  // navigateToTimer();
                                   change_appearance (index);
                                 },
                                 child: Container (

                                    margin: EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
                                    height: 60,
                                    decoration: BoxDecoration(

                                        color: (color_updater.caller == index)? color_updater.list1:color_updater.list3,
                                        boxShadow: [
                                          BoxShadow(
                                            color:  color_updater.button_unselected2,
                                            blurRadius: 20.0, // soften the shadow
                                            spreadRadius: 5.0, //extend the shadow

                                          ),
                                        ] ,
                                        border: Border.all(
                                          color: (color_updater.caller == index)? color_updater.list2:color_updater.list3,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15.0)

                                    ),
                                    child:

                                    Padding(
                                      padding: EdgeInsets.fromLTRB(7.0, 0, 0, 0),
                                      child: Row (

                                        mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children:<Widget> [

                                            Wrap (
                                                direction : Axis.horizontal,
                                                //   alignment : WrapAlignment.center,
                                                spacing : 10,
                                                // runAlignment = WrapAlignment.start,
                                                //  double runSpacing = 0.0,
                                                crossAxisAlignment : WrapCrossAlignment.center,

                                                //   verticalDirection : VerticalDirection.down,
                                                clipBehavior : Clip.none,
                                                children:<Widget> [

                                                  SizedBox(
                                                    height: 50,
                                                    width: 50,

                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                                                      child: SvgPicture.asset('assets/${options_good_habits[index].url}' ,
                                                        semanticsLabel:'${options_good_habits[index].url}' ,   ),
                                                    ),
                                                  ) ,

                                                  Text(
                                                    options_good_habits[index].habit ,
                                                    style: TextStyle (
                                                      color: (color_updater.caller == index)?  Color(0xFF712BD3):Color(0xFF383E53) ,
                                                      fontWeight:FontWeight.w600,
                                                      fontFamily: 'Manrope-VariableFont_wght',
                                                      fontSize: 16.0,
                                                    ),

                                                  ),

                                                  ]
                                            ),




                                          ],


                                      ),
                                    ),


                                  ),
                               );


                            },

                          ),
                             ),
                        ),
                      ),
                    ),


                Consumer <HomePage> ( builder : (context, updater, child) =>
                      Visibility(
                      visible: color_updater.visible2 ,

                         child: Container (
                           height:  MediaQuery.of(context).size.height*0.55,
                              child:    ListView.builder(
                              itemCount: options_bad_habits.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    change_appearance (index);
                                  },
                                  child: Container(

                                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                                    height: 60,
                                    decoration: BoxDecoration(

                                    color: (color_updater.caller == index)? color_updater.list1:color_updater.list3,
                                    boxShadow: [
                                      BoxShadow(
                                        color: color_updater.button_unselected2,
                                        blurRadius: 20.0, // soften the shadow
                                        spreadRadius: 5.0, //extend the shadow

                                      ),
                                    ],
                                    border: Border.all(
                                      color: (color_updater.caller == index)? color_updater.list2:color_updater.list3 ,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)

                                ),
                                child:

                                Padding(
                                  padding: EdgeInsets.fromLTRB(7.0, 0, 0, 0),
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[

                                      Wrap(
                                          direction: Axis.horizontal,
                                          //   alignment : WrapAlignment.center,
                                          spacing: 10,
                                          // runAlignment = WrapAlignment.start,
                                          //  double runSpacing = 0.0,
                                          crossAxisAlignment: WrapCrossAlignment
                                              .center,

                                          //   verticalDirection : VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: <Widget>[

                                            SizedBox(
                                              height: 50,
                                              width: 50,

                                              child:
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5.0, 0, 0, 0),
                                                child: SvgPicture.asset(
                                                  'assets/${options_bad_habits[index]
                                                      .url}',
                                                  semanticsLabel: '${options_bad_habits[index]
                                                      .url}',),
                                              ),
                                            ),

                                            Text(
                                              options_bad_habits[index].habit,
                                              style: TextStyle(
                                                color:  (color_updater.caller == index)? Color(0xFF712BD3):Color(0xFF383E53) ,
                                                fontWeight:FontWeight.w600,
                                                fontFamily: 'Manrope-VariableFont_wght',
                                                fontSize: 16.0,
                                              ),

                                            ),

                                          ]
                                      ),


                                    ],


                                  ),
                                ),


                              ),
                            );
                          }
                              ),),

                      ),),

                    GestureDetector(

                      onTap: (){

                        if(color_updater.visible1== true && color_updater.caller==0)
                        navigateToTimer();

                      },

                      child:
                      Consumer <HomePage> ( builder : (context, updater, child) =>

                        Align(
                          alignment:  Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 13, 20, 15),
                              width: MediaQuery.of(context).size.width ,
                              height: 55,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(16.0),
                              //  color:  color_updater.button_selected,
                                boxShadow: [
                                  BoxShadow (

                                  blurRadius: 5,

                                  color:
                                //  color_updater.button_unselected4,
                                  Color(0xFFBDACFB),
                                  offset: Offset(0 , 7)

                                ),


                                  BoxShadow (

                                      blurRadius: 3,

                                      color:
                                      //  color_updater.button_unselected4,
                                      Color(0xFFBDACFB),
                                      offset: Offset(2 , 0)

                                  ),  BoxShadow (

                                      blurRadius: 3,

                                      color:
                                      //  color_updater.button_unselected4,
                                      Color(0xFFBDACFB),
                                      offset: Offset(-2 , 0)

                                  ),


                                ],
                              gradient:

                              LinearGradient (
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF7F5BFF) ,


                                  Color(0xFF8338EC),

                                  Color(0xFF8338EC),
                                  Color(0xFF8338EC),
                                  Color(0xFF8338EC),


                                  Color(0xFF8338EC),
                                ],
                                stops: [
                                  0,

                                  0.05,

                                  0.2,
                                  0.5,
                                  0.9,


                                  1
                                ],
                              ),



                            ),
                            child:
                                  Center(
                                    child: Text ('Next',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          //  fontWeight: FontWeight.bold ,
                                          fontSize: 16.0,
                                        fontFamily: 'Manrope-VariableFont_wght',

                                        ),
                                ),
                                  ),


                          ),
                        ),
                      ),
                    ),



                    Align(
                      alignment:  Alignment.bottomCenter,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: MediaQuery.of(context).size.width/3 ,
                          height: 5,

                          decoration: BoxDecoration (
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0), )

                        /* child: Divider(
                                height: 0.0,
                                color: Colors.black,
                                thickness: 0.0,
                              ),*/
                      ),
                    ),
                 //  ),

              ],
            ),
          ),
      //  ),
      ),


       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}