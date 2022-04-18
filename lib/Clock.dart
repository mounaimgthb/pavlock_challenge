import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pavlok_challenge/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'HomeProvider.dart';



double radius = 96;
double strokeWidth = 33;



class Clock extends StatefulWidget{

  final ValueChanged<double> onAngleChanged;

  const Clock({Key? key , required this.onAngleChanged, }) : super(key: key);





  @override
  _ClockState createState() => _ClockState();



}


class _ClockState extends State<Clock> {

  HomePage time_updater = new HomePage();



  void timer (double value , double angle1 , double angle2){
    time_updater.updateTime(value , angle1 , angle2 ) ;
  }

  Offset _currentDragOffset1 = Offset.zero;
  Offset _currentDragOffset2 = Offset.zero;

  double currentAngle1 = toRadian(0);
  double currentAngle2 = toRadian(270);

  double startAngle1 = toRadian(0);
  double startAngle2 = toRadian(0);
  double totalAngle = toRadian(360);



    /*   @override
     initState()  {
        // TODO: implement initState
        super.initState();
        //   print('initState function run');
        // getData_Simulation();




      }*/

  @override
  Widget build(BuildContext context) {



    Size screenSize = MediaQuery.of(context).size;
   // Size canvasSize = Size(screenSize.width, screenSize.width+20);
    Size canvasSize = Size(275, 275);
    Offset center = canvasSize.center(Offset.zero);

    Offset knobPos1 = toPolar(center - Offset(33, 33),
        currentAngle1 + startAngle1, radius);

    Offset knobPos2 = toPolar(center - Offset(33, 33),
        currentAngle2 + startAngle2, radius);

    double dragAngle =  (currentAngle2 > currentAngle1) ?
    toRadian(360 - ( toDegree(currentAngle2) - toDegree(currentAngle1 ) )) : toRadian( toDegree(currentAngle1) - toDegree(currentAngle2 ) ) ;

    //math.atan2(knobPos2.dy-knobPos1.dy, knobPos2.dx-knobPos1.dx);

    time_updater  = Provider.of<HomePage>( context  );

    var angle1 = currentAngle1 , angle2 = currentAngle2 ;



    return
      /*Scaffold(
      backgroundColor: Colors.transparent,
      body: */
      Flex(
        direction: Axis.vertical,
        children: <Widget> [ Expanded(
          child: Align(
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 1/1,
              child: Stack  (
              alignment: Alignment.center,

              children: <Widget> [
                Container(
                  height: 225,
                  width: 225,

                  decoration: BoxDecoration (
                      shape: BoxShape.circle,
                  //  color: Colors.red,

                  ),
                  child: SvgPicture.asset(
                    'assets/Ellipse.svg',semanticsLabel: 'ellipse',
                    color: Color.fromRGBO(231,226,239, 1) ,
                  ),
                ),




              CustomPaint(
                size: canvasSize,
                child: Container(),
                painter: SliderPainter(
                    startAngle: currentAngle2,
                    currentAngle:  dragAngle
                   // (currentAngle1)
                        //-( currentAngle2  )
                  ,

                ),
              ),



                      Positioned(
                        left: knobPos2.dx,
                        top: knobPos2.dy,
                        child : GestureDetector(

                            onPanStart: (details){
                              RenderBox getBox = context.findRenderObject() as RenderBox;
                              _currentDragOffset2 = getBox.globalToLocal(details.globalPosition);

                            },
                            onPanUpdate:(details){
                              var previousOffset = _currentDragOffset2;

                              _currentDragOffset2 += details.delta;
                              angle2 = currentAngle2 +
                                  toAngle(_currentDragOffset2, center) -
                                  toAngle(previousOffset, center);

                              Offset knobPos1 = toPolar(center - Offset(33, 33),
                                  currentAngle1-toRadian(15) + startAngle1, radius);

                              Offset knobPos2 = toPolar(center - Offset(33, 33),
                                  angle2 + startAngle2, radius);


                                currentAngle2 = normalizeAngle(angle2);
                                widget.onAngleChanged(currentAngle2);
                                 timer(dragAngle , currentAngle2 , currentAngle1);
                                setState(() {});
                           /*  if( angle2 > angle1  ){    }else {
                                _currentDragOffset2 = previousOffset ;
                                currentAngle2 = normalizeAngle(currentAngle2);
                                widget.onAngleChanged(currentAngle2);
                                setState(() {});}*/




                            } ,

                            child: const _Knob2()
                        ),
                      ) ,
                      Positioned(
                        left: knobPos1.dx,
                        top: knobPos1.dy,
                        child : GestureDetector(

                            onPanStart: (details){
                              RenderBox getBox = context.findRenderObject() as RenderBox;
                              _currentDragOffset1 = getBox.globalToLocal(details.globalPosition);
                            },
                            onPanUpdate:(details){
                              var previousOffset = _currentDragOffset1;
                              _currentDragOffset1 += details.delta;
                               angle1 = currentAngle1 +
                                  toAngle(_currentDragOffset1, center) -
                                  toAngle(previousOffset, center);


                              Offset knobPos1 = toPolar(center - Offset(33, 33),
                                  angle1-toRadian(15) + startAngle1, radius);

                              Offset knobPos2 = toPolar(center - Offset(33, 33),
                                  currentAngle2 + startAngle2, radius);



                                currentAngle1 = normalizeAngle(angle1);
                                widget.onAngleChanged(currentAngle1);
                                timer(dragAngle, currentAngle2 , currentAngle1 );
                                setState(() {});
                         /* if( angle2 > angle1 ){       }else { }

                                _currentDragOffset1 = previousOffset ;
                                currentAngle1 = normalizeAngle(currentAngle1);
                                widget.onAngleChanged(currentAngle1);
                                timer(currentAngle1);
                                setState(() {});*/


                            } ,

                            child: const _Knob1()
                        ),
                      ),

                Container(
                    height: 166,
                    width: 166,

                    decoration: BoxDecoration (
                        shape: BoxShape.circle,
                        boxShadow: [ BoxShadow (

                            blurRadius: 1,

                            color: time_updater.button_unselected2,
                            offset: Offset(0 , 1)

                        ),
                        ]
                    ),
                    child: SvgPicture.asset('assets/Ellipse_small.svg',semanticsLabel: 'small ellipse')
                ),
                SvgPicture.asset('assets/Group_clock.svg',semanticsLabel: 'clock'),
                SvgPicture.asset('assets/Group_number.svg',semanticsLabel: 'hours'),



                Column (
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
                        Text(


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

                 ],
                ),
            ),
          ),
        ),
        ],
      );


    //  ),

    // );
  }


}



class SliderPainter extends CustomPainter {

  final double startAngle;
  final double currentAngle;

  SliderPainter({required this.startAngle, required this.currentAngle});

      @override
      void paint(Canvas canvas, Size size) {
        // TODO: implement paint
        Offset center = size.center(Offset.zero);

        Rect rect = Rect.fromCircle(center: center, radius: radius);

        var purpleDragTrack = Paint()
          ..shader = SweepGradient(colors: [  Color(0xFF7F5BFF) ,  Color(0xFF8338EC),
            Color(0xFF8338EC),  Color(0xFF7F5BFF) ,
               ] ).createShader(rect)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth

          ..strokeCap = StrokeCap.round;


      /*  canvas.drawArc(
          rect,
          startAngle,
          math.pi * 2,
          false,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth,
        );*/

        canvas.drawArc(rect, startAngle, currentAngle, false, purpleDragTrack);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  
  
  
}



class _Knob1 extends StatelessWidget {
  const _Knob1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Color.fromRGBO(129 , 76, 247,  1),
        shape: BoxShape.circle,
        border: Border.all(color:  Color.fromRGBO(153, 122, 254, 1),  width: 0.5),
        gradient:    LinearGradient (
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(181, 160, 255, 1),

            Color.fromRGBO(153, 122, 254, 1),
            Color.fromRGBO(153, 125, 255, 1),

            //  Color.fromRGBO(130, 68, 242, 1),
          ],
          stops: [
            0.1,
            0.3,

            // 0.95,
            1,

          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset('assets/wake_up.svg',
          semanticsLabel: 'wake',   color: Colors.white,             ),
      ) ,
    );
  }

}



class _Knob2 extends StatelessWidget {
  const _Knob2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: Color.fromRGBO(129 , 76, 247,  1),
          shape: BoxShape.circle,
          border: Border.all(color:  Color.fromRGBO(153, 122, 254, 1), width: 0.5),
          gradient:    LinearGradient (
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(181, 160, 255, 1),

                  Color.fromRGBO(153, 122, 254, 1),
                  Color.fromRGBO(153, 125, 255, 1),

                //  Color.fromRGBO(130, 68, 242, 1),
                ],
                stops: [
                  0.1,
                 0.3,

                 // 0.95,
                  1,

                ],
              ),
             ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/bedtime.svg',
                semanticsLabel: 'wake',   color: Colors.white,             ),
      ) ,
    );
  }

}



