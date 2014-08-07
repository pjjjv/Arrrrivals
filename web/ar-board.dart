import 'package:polymer/polymer.dart';
import 'dart:collection';

@CustomTag('ar-board')
class Board extends PolymerElement {
  @published LinkedHashMap arrivals2;
        
  get arrivalses { 
    print('board get arrivalses: '+arrivals2.toString());  
    return arrivals2;
  }
  
  void set arrivalses(var arrivals3) {
    arrivals2 = arrivals3;
    print('board set arrivalses: '+arrivals2.toString()); 
    if (arrivals2 != null) {
      print('      set arrivalses1: '+arrivals2['time'].toString());  
    } 
  }
        
  Board.created() : super.created() {
    print("board created");
  }
}