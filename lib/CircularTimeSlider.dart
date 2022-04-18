import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pavlok_challenge/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'HomeProvider.dart';



double radius = 135;
double strokeWidth = 30;

class CircularTimeSlider extends StatefulWidget{






  @override
  _CircularTimeSliderState createState() => _CircularTimeSliderState();



}


class _CircularTimeSliderState extends State<CircularTimeSlider> {

  HomePage time_updater= new HomePage();

  Widget text_hours = Text('');

  Widget clock_text = new Column() ;

    void timer (double value){
      time_updater.updateTime(value , value , value) ;
    }

  /*   @override
     initState()  {
        // TODO: implement initState
        super.initState();
        //   print('initState function run');
        // getData_Simulation();




      }*/

  @override
  Widget build(BuildContext context) {


    time_updater  = Provider.of<HomePage>( context  );



    return
      /*Scaffold(
      backgroundColor: Colors.transparent,
      body: */
      Container(
        height: 240.0,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
          /* width: 100.0,
            height: 100.0,*/
            decoration: BoxDecoration(
             //   border: Border.all(
                 // color: Colors.red,
             //   )
            ),
            child:Center(

                child:AspectRatio(
                  aspectRatio: 1/1 ,
                  child:  Stack  (
                    alignment: Alignment.center,
                    children: <Widget> [
                      SvgPicture.asset('assets/Ellipse.svg',semanticsLabel: 'ellipse'),
                      SvgPicture.asset('assets/Ellipse_small.svg',semanticsLabel: 'small ellipse'),
                      SvgPicture.asset('assets/Group_clock.svg',semanticsLabel: 'clock'),
                      SvgPicture.asset('assets/Group_number.svg',semanticsLabel: 'hours'),


                      clock_text=    Column (
                             mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                              Consumer <HomePage> ( builder : (context, updater, child) =>
                                  Text(

                                    time_updater.hours

                                    ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: time_updater.hours_clockColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),

                              ),
                ),
                         Consumer <HomePage> ( builder : (context, updater, child) =>
                         text_hours= Text(


                                       time_updater.minutes

                                       ,

                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                         color: time_updater.mins_clockColor,
                                         fontSize: 15.0,
                                         letterSpacing: 1.5,
                                         fontWeight: FontWeight.bold,
                                       ),
                                    ),
                                  ),

                              ],
                            ),

                 SleekCircularSlider (
                     appearance: CircularSliderAppearance(
                      customColors: CustomSliderColors(
                          trackColor: Color.fromRGBO(241, 241, 241,  1),
                        progressBarColor: Color.fromRGBO(130, 68, 242,  1)
                      ),
                        startAngle: 250,
                        angleRange: 360,
                        customWidths : CustomSliderWidths( progressBarWidth: 25 , shadowWidth: 0 ),
                        size: 215 ,
                      ),
                      min: 0,
                      max: 72,
                      initialValue: 24 ,

                      onChange: (double value) {
                        // callback providing a value while its being changed (with a pan gesture)
                       timer (value);
                      },
                      onChangeStart: (double startValue) {
                        // callback providing a starting value (when a pan gesture starts)
                      },
                      onChangeEnd: (double endValue) {
                        // ucallback providing an ending value (when a pan gesture ends)
                      },
                      innerWidget: (double value) {

                       return  clock_text ;

                        // use your custom widget inside the slider (gets a slider value from the callback)
                      },
                    ) ,



                    ],
                  ),
                ),


            ),
          ),
        ),
      );


      //  ),

   // );
  }


}





