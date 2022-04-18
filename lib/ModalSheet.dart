import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pavlok_challenge/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'HomeProvider.dart';


 int caller = 3 ;

class Modal_Sheet extends StatefulWidget{

  //final BuildContext context1;


  static int init_caller(){
    return caller ;
  }





  @override
  _Modal_SheetState createState() => _Modal_SheetState();



}


class _Modal_SheetState extends State<Modal_Sheet> {


  HomePage time_reminder = new HomePage();




  void update_caller (int index){
    caller = index;
    setState(() {

    });
  }

  void update_reminder (String rem){
    time_reminder.update_reminder ( rem) ;
  }



 /* void set_caller(){
     time_reminder.caller2 ;
  }*/

  @override
  Widget build(BuildContext context) {


    // var caller = time_reminder.caller ;
   //  time_reminder  = Provider.of<HomePage>( context  );
   // final model = context.watch()<HomePage>();
   return
     ChangeNotifierProvider<HomePage>(
       create: (_) => HomePage(),

       child: Builder(
         builder: (BuildContext newContext){
           void dismiss() {
             Navigator.of(newContext).pop() ;
           }

        return   OrientationBuilder(
           builder: (context, orientation) {
             Widget modal = orientation == Orientation.portrait ? Column():  ListView();
             return DraggableScrollableSheet(

               initialChildSize: orientation == Orientation.portrait ? 0.9 : 1 ,
               maxChildSize: 1,
               builder: (_, controller) =>

                   Container(

                     decoration: BoxDecoration(
                       color: Color.fromRGBO(245, 245, 245, 1),

                       borderRadius: BorderRadius.vertical(
                         top: Radius.circular(20.0),
                       ),

                     ),

                     child: ListView(
                       controller: controller,
                     //  crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.min,
                       children: [
                         Align(
                           alignment: Alignment.topCenter,
                           child: Container(
                               margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width / 12,
                               height: 4,

                               decoration: BoxDecoration(
                                 color: Color(0xffE9E9E9),
                                 borderRadius: BorderRadius.circular(15.0),)

                             /* child: Divider(
                                      height: 0.0,
                                      color: Colors.black,
                                      thickness: 0.0,
                                          ),*/
                           ),
                         ),

                         Align(
                           alignment: Alignment.topCenter,
                           child: Text('Reminder',
                             style: TextStyle(
                               color: Color(0xff383E53),
                               fontSize: 20.0,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'Manrope-VariableFont_wght',
                             ),
                           ),
                         ),

                         GestureDetector(
                           onTap: () {
                             update_caller(1);
                             update_reminder('20 min');
                             Provider.of<HomePage>(newContext, listen: true)
                                 .update_reminder('20 min');

                             // HomePage().next_done = '20 min';


                             setState(() {

                             });
                           },
                           child: Container(
                             margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                             height: 35,
                             decoration: BoxDecoration(
                               border: Border(
                                 top: BorderSide(
                                   width: 1.0,
                                   color: (caller == 1) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                                 bottom: BorderSide(
                                   width: 1.0,
                                   color: (caller == 1) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                               ),
                             ),
                             child: Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [

                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[
                                       Text('',),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('20',
                                       style: TextStyle(
                                         color: (caller == 1)
                                             ? Color(0xff383E53)
                                             : Color(0xff939295),
                                         fontSize: (caller == 1) ? 17.0 : 15.0,
                                        // fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.start,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('min',
                                       style: TextStyle(
                                         color: (caller == 1)
                                             ? Color(0xff383E53)

                                             : Color.fromRGBO(245, 245, 245, 1),
                                         fontSize: (caller == 1) ? 17.0 : 15.0,
                                        // fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),

                               ],
                             ),
                           ),
                         ),

                         GestureDetector(
                           onTap: () {
                             update_caller(2);
                             update_reminder('25 min');
                             setState(() {

                             });
                           },
                           child: Container(
                             height: 35,
                             decoration: BoxDecoration(
                               border: Border(
                                 top: BorderSide(
                                   width: 1.0,
                                   color: (caller == 2) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                                 bottom: BorderSide(
                                   width: 1.0,
                                   color: (caller == 2) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                               ),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[
                                       Text('',),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('25',
                                       style: TextStyle(
                                         color: (caller == 2)
                                             ? Color(0xff383E53)
                                             : Color(0xff939295),
                                         fontSize: (caller == 2) ? 18.0 : 16.0,
                                       //  fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.start,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('min',
                                       style: TextStyle(
                                         color: (caller == 2)
                                             ? Color(0xff383E53)

                                             : Color.fromRGBO(245, 245, 245, 1),
                                         fontSize: (caller == 2) ? 18.0 : 16.0,
                                       //  fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),


                               ],
                             ),
                           ),
                         ),

                         GestureDetector(
                           onTap: () {
                             update_caller(3);
                             update_reminder('30 min');
                             setState(() {

                             });
                           },
                           child: Container(
                             height: 35,
                             decoration: BoxDecoration(
                               border: Border(
                                 top: BorderSide(
                                   width: 1.0,
                                   color: (caller == 3) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                                 bottom: BorderSide(
                                   width: 1.0,
                                   color: (caller == 3) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                               ),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[
                                       Text('',),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('30',
                                       style: TextStyle(
                                         color: (caller == 3)
                                             ? Color(0xff383E53)
                                             : Color(0xff939295),
                                         fontSize: (caller == 3) ? 20.0 : 18.0,
                                        // fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.start,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('min',
                                       style: TextStyle(
                                         color: (caller == 3)
                                             ? Color(0xff383E53)

                                             : Color.fromRGBO(245, 245, 245, 1),
                                         fontSize: (caller == 3) ? 20.0 : 18.0,
                                         //fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),

                         GestureDetector(
                           onTap: () {
                             update_caller(4);
                             update_reminder('35 min');
                             setState(() {

                             });
                           },
                           child: Container(
                             height: 35,
                             decoration: BoxDecoration(
                               border: Border(
                                 top: BorderSide(
                                   width: 1.0,
                                   color: (caller == 4) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                                 bottom: BorderSide(
                                   width: 1.0,
                                   color: (caller == 4) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                               ),
                             ),
                             child: Row(
                               //mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[
                                       Text('',),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('35',
                                       style: TextStyle(
                                         color: (caller == 4)
                                             ? Color(0xff383E53)
                                             : Color(0xff939295),
                                         fontSize: (caller == 4) ? 18.0 : 16.0,
                                        // fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.start,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('min',
                                       style: TextStyle(
                                         color: (caller == 4)
                                             ? Color(0xff383E53)

                                             : Color.fromRGBO(245, 245, 245, 1),
                                         fontSize: (caller == 4) ? 18.0 : 16.0,
                                        // fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),

                               ],
                             ),
                           ),
                         ),

                         GestureDetector(
                           onTap: () {
                             update_caller(5);
                             update_reminder('40 min');
                             setState(() {

                             });
                           },
                           child: Container(
                             height: 35,
                             decoration: BoxDecoration(
                               border: Border(
                                 top: BorderSide(
                                   width: 1.0,
                                   color: (caller == 5) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                                 bottom: BorderSide(
                                   width: 1.0,
                                   color: (caller == 5) ? Color.fromRGBO(
                                       230, 230, 230, 1) : Color.fromRGBO(
                                       245, 245, 245, 1),
                                 ),
                               ),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[
                                       Text('',),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.center,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('40',
                                       style: TextStyle(
                                         color: (caller == 5)
                                             ? Color(0xff383E53)
                                             : Color(0xff939295),
                                         fontSize: (caller == 5) ? 17.0 : 15.0,
                                        // fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                   flex: 1,
                                   child: Wrap(
                                     direction: Axis.horizontal,
                                     alignment: WrapAlignment.start,
                                     spacing: 10,
                                     // runAlignment = WrapAlignment.start,
                                     //  double runSpacing = 0.0,
                                     crossAxisAlignment: WrapCrossAlignment
                                         .center,
                                     children: <Widget>[ Text('min',
                                       style: TextStyle(
                                         color: (caller == 5)
                                             ? Color(0xff383E53)

                                             : Color.fromRGBO(245, 245, 245, 1),
                                         fontSize: (caller == 5) ? 17.0 : 15.0,
                                        // fontWeight: FontWeight.bold,
                                         fontFamily: 'Manrope-VariableFont_wght',
                                       ),

                                     ),
                                     ],
                                   ),
                                 ),

                               ],
                             ),
                           ),
                         ),


                         GestureDetector(
                           onTap: () {
                             //  dismiss();

                              Navigator.of(newContext).pop() ;
                            // Navigator.pushReplacementNamed( newContext, '/bedtime');
                           },
                           child: Align(
                             alignment:  Alignment.bottomCenter,
                             child: Container(
                               margin: EdgeInsets.fromLTRB(20, 25, 20, 15),
                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width,
                               height: 55,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(16.0),
                                 // color:  Color.fromRGBO(130, 68, 242,  1),
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

                                 LinearGradient(
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
                                 child: Text('Done',
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

                         Align(
                           alignment: Alignment.bottomCenter,
                           child: Container(
                               margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width / 3,
                               height: 5,

                               decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(15.0),)

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
             );
            },
           );
        },
       ),
     );



  }










}