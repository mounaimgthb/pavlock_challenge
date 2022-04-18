
import 'dart:math' as math;


import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pavlok_challenge/CircularTimeSlider.dart';
import 'package:pavlok_challenge/Clock.dart';
import 'package:pavlok_challenge/ModalSheet.dart' as modal;
import 'package:provider/provider.dart';


import 'HomeProvider.dart';
import 'ModalSheet.dart';
import 'ModalSheet.dart';

class BedTime extends StatefulWidget {
  BedTime({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

   String title ='demo';


  @override
  _BedTimeState createState() => _BedTimeState();
}

class _BedTimeState extends State<BedTime> {
  int _caller = 3;
  Widget clock = new CircularTimeSlider();
 Widget modalsheet = new Modal_Sheet();

  HomePage time_updater = new HomePage();

  void changeButton_function (){
    time_updater.next_done = 'Done';
  }


  void update_reminder (String rem){
    time_updater.update_reminder ( rem) ;
  }


  @override
  initState()  {
    // TODO: implement initState
    super.initState();
    //   print('initState function run');
    // getData_Simulation();

    _caller = modal.caller ;

   /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);*/

  }







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

    String reminder (){
      _caller = modal.caller ;
      String s='';
      if(_caller==1){
        s='20 min';

      }else if(_caller==2){
        s='25 min';
      }else if (_caller==3){
        s='30 min';
      }else if(_caller==4){
        s='35 min';
      }else if(_caller==5){
        s='40 min';
      }
      return s ;

    }


    time_updater  = Provider.of<HomePage>( context  );

    return Scaffold(


      backgroundColor: Color.fromRGBO(252, 251, 255, 1),
      body:Container(
        height:  MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: SingleChildScrollView(
          child: Column (


            mainAxisAlignment:MainAxisAlignment.start ,


            children: <Widget>[

              Container(
                margin: EdgeInsets.fromLTRB(0, 30.0, 0.0, 0.0),
                child: SizedBox(

                  height: 50,
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),

                    child:   Center(
                      child: Row (

                          mainAxisAlignment:MainAxisAlignment.start ,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: <Widget>[





                                      IconButton(
                                        onPressed: () {
                                        Navigator.pushReplacementNamed(context, '/goal_selection' );
                                      } ,
                                        iconSize: 20,
                                        splashColor: Colors.grey[50],
                                            icon: Icon( Icons.arrow_back_ios ,
                                                        color: Colors.black ,

                                                                  ),
                                            alignment: Alignment.center,

                                                  ),









                                   ]
                                ),
                    ),
                           ),
                      ),
              ) ,

                  Container(
                    child: Text(
                      'Set bedtime and wake up' ,
                      style: TextStyle(
                        color: Colors.black ,
                        fontSize: 23.0,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope-VariableFont_wght',
                      ),


                    ),

                  ),

              Container(
                child: SizedBox(
                  height: 240.0,
                  width: 240,
                  child: Clock(
                    onAngleChanged: (angle) {
                    //  var minutes = ((angle / (math.pi * 2)) * 50).toInt();
                      // setState(() {});
                    },
                  ),
                ),
              ),

                 // clock,
                  Container(
                       margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          Wrap(
                              direction : Axis.horizontal,
                              alignment : WrapAlignment.start,
                              spacing : 10,
                              // runAlignment = WrapAlignment.start,
                              //  double runSpacing = 0.0,
                              crossAxisAlignment : WrapCrossAlignment.center,

                              //   verticalDirection : VerticalDirection.down,
                              clipBehavior : Clip.none,
                              children :  <Widget>[

                                SvgPicture.asset('assets/light.svg',
                                    semanticsLabel: 'light',) ,

                                Text(time_updater.updateText() ,
                                  style: TextStyle(
                                    color: Colors.black ,
                                    fontSize: 12.0,
                                    letterSpacing: 0.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Manrope-VariableFont_wght'
                                  ),

                                ),

                              ]


                          )

                        ] ),
                  ),

              Container(
                margin: EdgeInsets.fromLTRB(15.0, 10.0, 30.0, 0.0) ,
                child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [

                          Container(
                            //   margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0),
                            decoration:BoxDecoration(
                            //  border: Border.all(color: Colors.black)
                            ),
                            child: Row (

                              mainAxisAlignment: MainAxisAlignment.start,
                                children:<Widget> [
                                  Wrap(
                                      direction : Axis.horizontal,
                                      alignment : WrapAlignment.start,
                                      spacing : 0,
                                      // runAlignment = WrapAlignment.start,
                                      //  double runSpacing = 0.0,
                                      crossAxisAlignment : WrapCrossAlignment.center,

                                      //   verticalDirection : VerticalDirection.down,
                                      clipBehavior : Clip.none,
                                      children :  <Widget>[
                                        IconButton(onPressed: (){},
                                          icon: SvgPicture.asset('assets/bedtime.svg',
                                            semanticsLabel: 'bed',) ,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Bedtime',
                                              style: TextStyle(
                                                color: Color(0xFF939295),
                                                fontSize: 12.0,
                                                letterSpacing: 0.2,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Inter-VariableFont_slnt,wght',
                                              ),

                                            ),

                                        Consumer <HomePage> ( builder : (context, updater, child) =>
                                              Text(  '${time_updater.sleep_time}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Inter-VariableFont_slnt,wght',
                                                ),
                                              ),
                                            )

                                          ],
                                        ),

                                      ]


                                  )

                                ] ),
                          ),

                          Container(
                            //  margin: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                            decoration:BoxDecoration(
                              //  border: Border.all(color: Colors.black)
                            ),
                            child: Row (
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:<Widget> [

                                  Wrap(
                                    // key: null,
                                    direction : Axis.horizontal,
                                    alignment : WrapAlignment.start,
                                    spacing : 0,
                                    // runAlignment = WrapAlignment.start,
                                    //  double runSpacing = 0.0,
                                    crossAxisAlignment : WrapCrossAlignment.center,

                                    //   verticalDirection : VerticalDirection.down,
                                    clipBehavior : Clip.none,
                                    children :  <Widget>[
                                      IconButton(onPressed: (){},
                                        icon: SvgPicture.asset('assets/wake_up.svg',
                                          semanticsLabel: 'wake',) ,
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Wake up',
                                            style: TextStyle(
                                              color: Color(0xFF939295),
                                              fontSize: 12.0,
                                              letterSpacing: 0.2,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter-VariableFont_slnt,wght',
                                            ),
                                          ),

                                     Consumer <HomePage> ( builder : (context, updater, child) =>
                                          Text(
                                            '${time_updater.wakeup_time}',
                                            style: TextStyle(
                                              color: Colors.black ,
                                              fontSize: 20.0,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                     ),

                                        ],
                                      )


                                    ],



                                  ),

                                ] ),
                          ),



                    ] ),
              ),

                    Container(
                      margin: EdgeInsets.fromLTRB(20, 15, 20, 0),

                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(

                        color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                               color: time_updater.button_unselected2,
                               blurRadius: 20.0, // soften the shadow
                               spreadRadius: 5.0, //extend the shadow

                             ),
                           ] ,
                           border: Border.all(
                         color: Colors.white,

                           ),
                        borderRadius: BorderRadius.circular(16.0)

                      ),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10,15,10,15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                         // crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                          Wrap (
                          direction : Axis.vertical,
                       //   alignment : WrapAlignment.center,
                          spacing : 10,
                          // runAlignment = WrapAlignment.start,
                          //  double runSpacing = 0.0,
                          crossAxisAlignment : WrapCrossAlignment.start,

                          //   verticalDirection : VerticalDirection.down,
                          clipBehavior : Clip.none,

                          children :  <Widget>[
                            Text('Repeat days',
                              style: TextStyle(
                                color: Color(0xff0D0E0F) ,
                                fontSize: 17.0,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter-VariableFont_slnt,wght',
                              ),

                            ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             
                              children: [
                                Wrap (
                                    direction : Axis.horizontal,
                                    alignment : WrapAlignment.spaceEvenly,
                                    spacing :  MediaQuery.of(context).size.width/40,
                                 //    runAlignment : WrapAlignment.start,
                                    //  double runSpacing = 0.0,
                                    crossAxisAlignment : WrapCrossAlignment.center,

                                    //   verticalDirection : VerticalDirection.down,
                                    clipBehavior : Clip.none,

                                    children :  <Widget>[

                                     Consumer <HomePage> ( builder : (context, updater, child) =>
                                           GestureDetector(
                                            onTap:  (){
                                              time_updater.click_repeat_buttons(0);
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              color: Color(0xffF6F7FB),
                                              shape: BoxShape.circle,
                                              border: Border.all(color:( time_updater.repeat_days[0] )? Color(0xFF7F5BFF)  : Color(0xffF6F7FB) ,
                                                  width: 0 ),
                                              boxShadow: [ BoxShadow (

                                                  blurRadius:( time_updater.repeat_days[0] )?   20:0 ,


                                                  color: Color(0xFFBDACFB) ,
                                                  offset: Offset(0 , ( time_updater.repeat_days[0] )?   5:0)

                                              ),
                                              ],
                                              gradient:  ( time_updater.repeat_days[0] )?   LinearGradient (
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [


                                                  Color(0xFF7F5BFF) ,
                                                  Color(0xFF7F5BFF) ,
                                                  Color(0xFF8338EC),
                                                  Color(0xFF8338EC),
                                                ],
                                                stops: [
                                                  0.1,

                                                  0.2,
                                                  0.8,

                                                  1
                                                ],
                                              ): null ,
                                            ),
                                            child:  Center(
                                              child: Text ('M',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: ( time_updater.repeat_days[0] )?  Colors.white: Colors.black ,
                                                  fontWeight: FontWeight.bold ,
                                                  fontSize: 16.0,
                                                  fontFamily: 'Manrope-VariableFont_wght',
                                                ),
                                              ),
                                            ),

                                            ),
                                          ),
                                        ),


                                      Consumer <HomePage> ( builder : (context, updater, child) =>
                                          GestureDetector(
                                            onTap:  (){
                                              time_updater.click_repeat_buttons(1);
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF6F7FB),
                                                shape: BoxShape.circle,
                                                border: Border.all(color:( time_updater.repeat_days[1] )? Color(0xFF8338EC) : Color(0xffF6F7FB),
                                                    width: 0 ),
                                                boxShadow: [ BoxShadow (

                                                    blurRadius:( time_updater.repeat_days[1] )?   20:0 ,


                                                    color:  Color(0xFFBDACFB) ,
                                                    offset: Offset(0 , ( time_updater.repeat_days[1] )?   5:0)

                                                ),
                                                ],
                                                gradient:  ( time_updater.repeat_days[1] )?   LinearGradient (
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [


                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF8338EC),
                                                    Color(0xFF8338EC),
                                                  ],
                                                  stops: [
                                                    0.1,

                                                    0.2,

                                                    0.8,

                                                    1
                                                  ],
                                                ): null ,
                                              ),
                                              child:  Center(
                                                child: Text ('T',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ( time_updater.repeat_days[1] )?  Colors.white: Colors.black ,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 16.0,
                                                    fontFamily: 'Manrope-VariableFont_wght',
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                      ),

                                      Consumer <HomePage> ( builder : (context, updater, child) =>
                                          GestureDetector(
                                            onTap:  (){
                                              time_updater.click_repeat_buttons(2);
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF6F7FB),
                                                shape: BoxShape.circle,
                                                border: Border.all(color:( time_updater.repeat_days[2] )? Color(0xFF8338EC) : Color(0xffF6F7FB),
                                                    width: 0 ),
                                                boxShadow: [ BoxShadow (

                                                    blurRadius:( time_updater.repeat_days[2] )?   20:0 ,


                                                    color: Color(0xFFBDACFB) ,
                                                    offset: Offset(0 , ( time_updater.repeat_days[2] )?   5:0)

                                                ),
                                                ],
                                                gradient:  ( time_updater.repeat_days[2] )?   LinearGradient (
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [


                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF8338EC),
                                                    Color(0xFF8338EC),
                                                  ],
                                                  stops: [
                                                    0.1,

                                                    0.2,

                                                    0.8,

                                                    1
                                                  ],
                                                ): null ,
                                              ),
                                              child:  Center(
                                                child: Text ('W',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ( time_updater.repeat_days[2] )?  Colors.white: Colors.black ,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 16.0,
                                                    fontFamily: 'Manrope-VariableFont_wght',
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                      ),

                                      Consumer <HomePage> ( builder : (context, updater, child) =>
                                          GestureDetector(
                                            onTap:  (){
                                              time_updater.click_repeat_buttons(3);
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF6F7FB),
                                                shape: BoxShape.circle,
                                                border: Border.all(color:( time_updater.repeat_days[3] )? Color(0xFF8338EC) : Color(0xffF6F7FB) ,
                                                    width: 0 ),
                                                boxShadow: [ BoxShadow (

                                                    blurRadius:( time_updater.repeat_days[3] )?   20:0 ,


                                                    color: Color(0xFFBDACFB) ,
                                                    offset: Offset(0 , ( time_updater.repeat_days[3] )?   5:0)

                                                ),
                                                ],
                                                gradient:  ( time_updater.repeat_days[3] )?   LinearGradient (
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [


                                                    Color(0xFF7F5BFF) ,

                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF8338EC),
                                                    Color(0xFF8338EC),
                                                  ],
                                                  stops: [
                                                    0.1,

                                                    0.2,

                                                    0.8,

                                                    1
                                                  ],
                                                ): null ,
                                              ),
                                              child:  Center(
                                                child: Text ('T',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ( time_updater.repeat_days[3] )?  Colors.white: Colors.black ,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 16.0,
                                                    fontFamily: 'Manrope-VariableFont_wght',
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                      ),

                                      Consumer <HomePage> ( builder : (context, updater, child) =>
                                          GestureDetector(
                                            onTap:  (){
                                              time_updater.click_repeat_buttons(4);
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF6F7FB),
                                                shape: BoxShape.circle,
                                                border: Border.all(color:( time_updater.repeat_days[4] )? Color(0xFF8338EC) : Color(0xffF6F7FB) ,
                                                    width: 0 ),
                                                boxShadow: [ BoxShadow (

                                                    blurRadius:( time_updater.repeat_days[4] )?   20:0 ,


                                                    color: Color(0xFFBDACFB) ,
                                                    offset: Offset(0 , ( time_updater.repeat_days[4] )?   5:0)

                                                ),
                                                ],
                                                gradient:  ( time_updater.repeat_days[4] )?   LinearGradient (
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [


                                                    Color(0xFF7F5BFF) ,


                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF8338EC),
                                                    Color(0xFF8338EC),
                                                  ],
                                                  stops: [
                                                    0.1,

                                                    0.2,

                                                    0.8,

                                                    1
                                                  ],
                                                ): null ,
                                              ),
                                              child:  Center(
                                                child: Text ('F',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ( time_updater.repeat_days[4] )?  Colors.white: Colors.black ,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 16.0,
                                                    fontFamily: 'Manrope-VariableFont_wght',
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                      ),

                                      Consumer <HomePage> ( builder : (context, updater, child) =>
                                          GestureDetector(
                                            onTap:  (){
                                              time_updater.click_repeat_buttons(5);
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF6F7FB),
                                                shape: BoxShape.circle,
                                                border: Border.all(color:( time_updater.repeat_days[5] )? Color(0xFF8338EC) : Color(0xffF6F7FB) ,
                                                    width: 0 ),
                                                boxShadow: [ BoxShadow (

                                                    blurRadius:( time_updater.repeat_days[5] )?   20:0 ,


                                                    color: Color(0xFFBDACFB) ,
                                                    offset: Offset(0 , ( time_updater.repeat_days[5] )?   5:0)

                                                ),
                                                ],
                                                gradient:  ( time_updater.repeat_days[5] )?   LinearGradient (
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [


                                                    Color(0xFF7F5BFF) ,


                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF8338EC),
                                                    Color(0xFF8338EC),
                                                  ],
                                                  stops: [
                                                    0.1,

                                                    0.2,



                                                    0.8,

                                                    1
                                                  ],
                                                ): null ,
                                              ),
                                              child:  Center(
                                                child: Text ('S',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ( time_updater.repeat_days[5] )?  Colors.white: Colors.black ,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 16.0,
                                                    fontFamily: 'Manrope-VariableFont_wght',
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                      ),

                                      Consumer <HomePage> ( builder : (context, updater, child) =>
                                          GestureDetector(
                                            onTap:  (){
                                              time_updater.click_repeat_buttons(6);
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF6F7FB),
                                                shape: BoxShape.circle,
                                                border: Border.all(color:( time_updater.repeat_days[6] )? Color(0xFF8338EC): Color(0xffF6F7FB) ,
                                                    width: 0 ),
                                                boxShadow: [ BoxShadow (

                                                    blurRadius:( time_updater.repeat_days[6] )?   20:0 ,


                                                    color: Color(0xFFBDACFB) ,
                                                    offset: Offset(0 , ( time_updater.repeat_days[6] )?   5:0)

                                                ),
                                                ],
                                                gradient:  ( time_updater.repeat_days[6] )?   LinearGradient (
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [


                                                    Color(0xFF7F5BFF) ,


                                                    Color(0xFF7F5BFF) ,
                                                    Color(0xFF8338EC),
                                                    Color(0xFF8338EC),
                                                  ],
                                                  stops: [
                                                    0.1,

                                                    0.2,



                                                    0.8,

                                                    1
                                                  ],
                                                ): null ,
                                              ),
                                              child:  Center(
                                                child: Text ('S',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ( time_updater.repeat_days[6] )?  Colors.white: Colors.black ,
                                                    fontWeight: FontWeight.bold ,
                                                    fontSize: 16.0,
                                                    fontFamily: 'Manrope-VariableFont_wght',
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                      ),

                                    ]


                                ),
                              ],
                            ),

                          ] ),


                          ],
                        ),
                      ),
                    ),

                   Consumer <HomePage> ( builder : (context, updater, child) =>
                        GestureDetector(
                          onTap: () {
                           // changeButton_function ();
                              showModalBottomSheet(
                             // useRootNavigator: true,

                               backgroundColor: Colors.transparent,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.0),

                                  ),
                                ),
                                builder: (context) =>
                                modalsheet ,


                        ) ;
                           // setState((){});
                      },
                      child: Container(

                        margin: EdgeInsets.fromLTRB(20, 13, 20, 0),

                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: time_updater.button_unselected2,
                                blurRadius: 20.0, // soften the shadow
                                spreadRadius: 5.0, //extend the shadow

                              ),
                            ] ,
                            border: Border.all(
                              color: Colors.white,

                            ),
                            borderRadius: BorderRadius.circular(16.0)

                        ),

                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,15,10,15),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 25,
                              child: Center(
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment. center,

                                children: [

                                  Text ('Remind me before bedtime',
                                    style: TextStyle(
                                      color: Colors.black,
                                    fontSize: 15.0 ,
                                      fontWeight: FontWeight.bold ,
                                      fontFamily: 'Manrope',
                                    ),
                                  ),

                                    Text (reminder(),
                                      //time_updater.next_done,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold ,
                                        fontFamily: 'Manrope-VariableFont_wght',
                                      ),
                                    ),




                                ]
                                ),
                              ),
                            ),
                      ),
                      ),
                    ),
                  ),

                   Consumer <HomePage> ( builder : (context, updater, child) =>
                           GestureDetector(
                            onTap: (){
                              if(time_updater.next_done=='Next'){

                              }else  if(time_updater.next_done=='Done') {

                              }
                            },
                            child: Align(
                              alignment:  Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 25, 20, 15),
                                width: MediaQuery.of(context).size.width ,
                                height: 55,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(16.0),
                                 // color:  time_updater.button_selected,
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
                          alignment: Alignment.bottomCenter,
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

            ],
          ),
        ),
      ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.


       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}