import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:math' as math;
import 'package:pavlok_challenge/utils.dart';


class HomePage with ChangeNotifier {

   // String text_updated ;


   // String display = 'Loading Time';

  //timer variables
    String hours = '6hrs';
    String minutes = '00min';

    String sleep_time= '00:00 AM';
    String wakeup_time='6:00 AM';

    int hrs = 8 ;
    int mins = 0;

    int sleep_goal= 8;




    bool load_visible = false;

    // variables for clock
    Color hours_clockColor =  Color(0xFF712BD3);
    Color mins_clockColor = Colors.black ;

    //goal selection variables
    Color button_selected =  Color(0xFF8338EC);
    Color? button_unselected = Colors.grey[600];

    Color button_unselected3 =  Color.fromRGBO(252, 251, 255, 1);
    Color button_unselected2 =  Color.fromRGBO(241, 241, 246, 1);
    Color button_unselected4 =  Color.fromRGBO(213, 202, 253, 1);

    // variables for good/bad habits buttons
    bool visible1  = true, visible2= false, visible3=true;

    Color visibility1 =   Color(0xFF8338EC);
    Color visibility2 =  Color.fromRGBO(252, 251, 255, 1);

    Color visibility3 =  Color(0xFF8338EC);
    Color? visibility4 =   Color(0xFF939295) ;

    // variables for good/bad habits options
    Color list1 = Color(0xFFF8F3FF);
    Color list2 =  Color(0xFF8338EC);

    Color list3 = Colors.white , list4 = Colors.white;
    int caller =10 ;

   // next button effect
    bool pressed = false ;

    //ModalSheet variables
    String next_done = '30 min';
    int caller2 = 3 ;

    Color remind1 = Color(0xFF383E53) ;
    Color? remind2 = Color(0xFF939295) ;

    double size1 = 20.0 ;
    double size2 = 17.0 ;


    //day buttons repeat
    List<bool> repeat_days = [false, false, false, false, false,false, false];

    void click_repeat_buttons (int index){

      if(this.repeat_days[index] ){
        this.repeat_days[index]=false;
      }else {
        this.repeat_days[index]=true;
      }

    }


    void change_appearance (int value){

      this.caller = value ;
      notifyListeners();

    }




    void changeListview (int value){

      if(this.visible1 == true && value == 2) {

        this.visible1 = false;
        this.visible2 = true;

        this.visibility1 =  Color.fromRGBO(252, 251, 255, 1);
        this.visibility2 =  Color(0xFF8338EC);
        this.visibility3 = Color(0xFF939295) ;
        this.visibility4 =  Color(0xFF8338EC);

      }else if (this.visible1 == false && value == 1) {
        this.visible1 = true;
        this.visible2 = false;

        this.visibility1 =  Color(0xFF8338EC);
        this.visibility2 = Color.fromRGBO(252, 251, 255, 1);
        this.visibility3 =  Color(0xFF8338EC);
        this.visibility4 = Color(0xFF939295) ;
      }
      notifyListeners();

    }

    void update_reminder (String rem){

      this.next_done = rem ;
      notifyListeners();

    }

    void pressed_button (bool value){

      this.pressed = value ;
      notifyListeners();

    }


    Color selected () {

      return this.button_selected ;
    }

    Color? unselected (){
      return this.button_unselected ;
    }

    Color? color_selection (bool value) {

      if(value) {
        return    selected();
      }else {
        return    unselected();
      }


    }



    String updateText (){

      notifyListeners();

      if (this.hrs == this.sleep_goal) {
        return 'Matches your sleep goal ( 8hrs )';
      }else if( this.hrs < this.sleep_goal ) {
       return  'Under your sleep goal ( 8hrs )';
      }else {
        return  'Over your sleep goal ( 8hrs )';
      }



    }

    void updateTime (double hrs, double sleep, double wake ){

      int value = (  72* (hrs / (math.pi * 2))   ).round()   ;

      if(value >= 0 && value <3 ) {
        this.hrs = 0 ;
        this.mins = value *20 ;

      }else if( value >= 3 && value < 6 ) {
        this.hrs = 1 ;
        this.mins = (value-3) *20 ;

      }else if( value >= 6 && value < 9 ) {
        this.hrs = 2 ;
        this.mins = (value-6) *20 ;

      }else if( value >= 9 && value < 12 ) {
        this.hrs = 3 ;
        this.mins = (value-9) *20 ;

      }else if( value >= 12 && value < 15 ) {
        this.hrs = 4 ;
        this.mins = (value-12) *20 ;

      }else if( value >= 15 && value < 18 ) {
        this.hrs = 5 ;
        this.mins = (value-15) *20 ;

      }else if( value >= 18 && value < 21 ) {
        this.hrs = 6 ;
        this.mins = (value-18) *20 ;

      }else if( value >= 21 && value < 24 ) {
        this.hrs = 7 ;
        this.mins = (value-21) *20 ;

      }else if( value >= 24 && value < 27 ) {
        this.hrs = 8 ;
        this.mins = (value-24) *20 ;

      }else if( value >= 27 && value < 30 ) {
        this.hrs = 9 ;
        this.mins = (value-27) *20 ;

      }else if( value >= 30 && value < 33 ) {
        this.hrs = 10 ;
        this.mins = (value-30) *20 ;

      }else if( value >= 33 && value < 36 ) {
        this.hrs = 11 ;
        this.mins = (value-33) *20 ;

      }else if( value >= 36 && value < 39 ) {
        this.hrs = 12 ;
        this.mins = (value-36) *20 ;

      }else if( value >= 39 && value < 42 ) {
        this.hrs = 13 ;
        this.mins = (value-39) *20 ;

      }else if( value >= 42 && value < 45 ) {
        this.hrs = 14 ;
        this.mins = (value-42) *20 ;

      }else if( value >= 45 && value < 48 ) {
        this.hrs = 15 ;
        this.mins = (value-45) *20 ;

      }else if( value >= 48 && value < 51 ) {
        this.hrs = 16 ;
        this.mins = (value-48) *20 ;

      }else if( value >= 51 && value < 54 ) {
        this.hrs = 17 ;
        this.mins = (value-51) *20 ;

      }else if( value >= 54 && value < 57 ) {
        this.hrs = 18 ;
        this.mins = (value-54) *20 ;

      }else if( value >= 57 && value < 60 ) {
        this.hrs = 19 ;
        this.mins = (value-57) *20 ;

      }else if( value >= 60 && value < 63 ) {
        this.hrs = 20 ;
        this.mins = (value-60) *20 ;

      }else if( value >= 63 && value < 66 ) {
        this.hrs = 21;
        this.mins = (value-63) *20 ;

      }else if( value >= 66 && value < 69 ) {
        this.hrs = 22 ;
        this.mins = (value-66) *20 ;

      }else if( value >= 69 && value < 72 ) {
        this.hrs = 23 ;
        this.mins = (value-69) *20 ;

      }else if( value == 72 ) {
        this.hrs = 24 ;
        this.mins = (value-72) *20 ;
      }

     

      this.hours = 'hrs';
      this.minutes = 'min';

      this.hours = '${this.hrs}'+this.hours;

      if(this.mins == 0){
        this.minutes = '0'+this.minutes ;
      }
      this.minutes = '${this.mins}'+this.minutes;

      //calcul heure couché et reveil
      int a = toDegree(sleep).round();int b = toDegree(wake).round();

      //decalage entre l'horloge design et le cercle des angles intrinsec a flutter
      int decalage = 6 ;

      double result = toDegree(sleep)*24/360;

      int hours_int = result.toInt()+decalage;
      hours_int = hours_int % 24 ;

      double minutes_double = result - result.toInt();


      if(minutes_double < 0 ){
        minutes_double= minutes_double*(-1);
      }

      minutes_double = minutes_double*60/20;



      if(minutes_double >=0 && minutes_double <1 ){
        minutes_double = 0 ;
      }else if(minutes_double >=1 && minutes_double <2 ){
        minutes_double = 20 ;
      }else if(minutes_double >=2 && minutes_double < 3 ){
        minutes_double = 40 ;
      }

      int minutes_int = minutes_double.toInt();


      if( hours_int>=0 && hours_int <12 ){

        if(minutes_int==0){
          if(hours_int==0){
            this.sleep_time = '00'+':'+'00'+' AM';
          }else {
            this.sleep_time = '${hours_int}'+':'+'00'+' AM';
          }

        }else {
          if(hours_int==0){
            this.sleep_time = '00'+':'+'${minutes_int}'+' AM';
          }else {
            this.sleep_time = '${hours_int}'+':'+'${minutes_int}'+' AM';
          }

        }

      } else if(hours_int>=12 && hours_int <=23){

        if(minutes_int==0){
          if(hours_int==0){
            this.sleep_time = '00'+':'+'00'+' PM';
          }else {
            this.sleep_time = '${hours_int}'+':'+'00'+' PM';
          }

        }else {
          if(hours_int==0){
            this.sleep_time = '00'+':'+'${minutes_int}'+' PM';
          }else {
            this.sleep_time = '${hours_int}'+':'+'${minutes_int}'+' PM';
          }

        }


      }

       result = toDegree(wake)*24/360;

       hours_int = result.toInt()+decalage;
      hours_int = hours_int % 24 ;

       minutes_double = result - result.toInt();
       if(minutes_double < 0 ){
         minutes_double= minutes_double*(-1);
       }
      minutes_double = minutes_double*60/20;



       if(minutes_double >=0 && minutes_double <1 ){
         minutes_double = 0 ;
       }else if(minutes_double >=1 && minutes_double <2 ){
         minutes_double = 20 ;
       }else if(minutes_double >=2 && minutes_double < 3 ){
         minutes_double = 40 ;
       }


       minutes_int = minutes_double.toInt();




      if( hours_int>=0 && hours_int <12 ){

        if(minutes_int==0){
          if(hours_int==0){
            this.wakeup_time = '00'+':'+'00'+' AM';
          }else {
            this.wakeup_time = '${hours_int}'+':'+'00'+' AM';
          }

        }else {
          if(hours_int==0){
            this.wakeup_time = '00'+':'+'${minutes_int}'+' AM';
          }else {
            this.wakeup_time = '${hours_int}'+':'+'${minutes_int}'+' AM';
          }

        }

      } else if(hours_int>=12 && hours_int <=23){

        if(minutes_int==0){
          if(hours_int==0){
            this.wakeup_time = '00'+':'+'00'+' PM';
          }else {
            this.wakeup_time = '${hours_int}'+':'+'00'+' PM';
          }

        }else {
          if(hours_int==0){
            this.wakeup_time = '00'+':'+'${minutes_int}'+' PM';
          }else {
            this.wakeup_time = '${hours_int}'+':'+'${minutes_int}'+' PM';
          }

        }


      }




      notifyListeners();

    }


    double initilize (){


      this.hours = 'hrs';
      this.minutes = 'min';

      this.hours = '8'+this.hours;
      this.minutes = '0'+this.minutes;

      notifyListeners();

      return 8 ;

    }





    void updateVisibility (bool visible){

      this.load_visible = visible;
      notifyListeners();

    }





    @override
    void dispose() {
      // TODO: implement dispose
     // textController.dispose();

      super.dispose();


    }



}